class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user_opinions, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    login_required
    @users = User.all.includes(:id, :username, :fullname, :photo, :cover_image, created_at)
    if params[:flag] == "followers"
      @all_spesific_users = @user.followers
    elsif params[:flag] == "followed_users"
      @all_spesific_users = @user.followeds
    end
    @flag = params[:flag]
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      # @user = User.includes(:id, :authorId, :text, :created_at).find(params[:id])
      # set_user_opinions(@user)
      # p "DEBUG22:#{@user}"
      # @user
    end

  def set_user_opinions
    # @user_opinions ||= Opinion.all.order(created_at: :desc).includes(:user)
    @timeline_opinions = @user.opinions
    # @timeline_opinions = @user.opinions.includes(:id, :authorId, :text, :created_at)
    @timeline_opinions
  end


    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :fullname, :photo, :cover_image)
    end
end
