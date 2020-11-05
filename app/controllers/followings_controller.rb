class FollowingsController < ApplicationController
  before_action :set_following, only: [:show, :edit, :update, :destroy]

  # GET /followings
  # GET /followings.json
  def index
    login_required
    @followings = Following.all
  end

  # GET /followings/1
  # GET /followings/1.json
  def show
  end

  # GET /followings/new
  def new
    @following = Following.new
  end

  # GET /followings/1/edit
  def edit
  end

  # POST /followings
  # POST /followings.json
  def create
    @following = Following.new(following_params)
    p "DEBUG1:FOLLOWER ID:#{@following.followerId}"
    p "DEBUG1:FOLLOWED ID:#{@following.followedId}"
    respond_to do |format|
      if @following.save
        format.html { redirect_to opinions_path, notice: 'Following was successfully created.' }
        format.json { render :show, status: :created, location: @following }
      else
        format.html { render :new }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /followings/1
  # PATCH/PUT /followings/1.json
  def update
    respond_to do |format|
      if @following.update(following_params)
        format.html { redirect_to @following, notice: 'Following was successfully updated.' }
        format.json { render :show, status: :ok, location: @following }
      else
        format.html { render :edit }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followings/1
  # DELETE /followings/1.json
  def destroy
    @following.destroy_all
    respond_to do |format|
      format.html { redirect_to opinions_path, notice: 'Following was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following
      @following = Following.where(followerId: get_current_user.id, followedId: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def following_params
      params.require(:following).permit(:followerId, :followedId)
    end
end
