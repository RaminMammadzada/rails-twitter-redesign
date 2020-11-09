class FollowingsController < ApplicationController
  before_action :set_following, only: [:show, :edit, :update, :destroy]

  # GET /followings
  # GET /followings.json
  def index
    login_required
    @followings = Following.all.includes(:id, :followerId, :followedId, :created_at)
  end

  # GET /followings/1
  # GET /followings/1.json
  def show
  end

  # GET /followings/new
  def new
    @following = Following.new
  end

  # POST /followings
  # POST /followings.json
  def create
    @following = Following.new(following_params)
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
    respond_to do |format|
      if @following.destroy_all
        format.html { redirect_to opinions_path, notice: 'Following was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :destroy }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following
      @following = Following.where(followerId: get_current_user.id, followedId: params[:id]).includes(:id, :followerId, :followedId, :created_at)
    end

    # Only allow a list of trusted parameters through.
    def following_params
      params.require(:following).permit(:followerId, :followedId)
    end
end
