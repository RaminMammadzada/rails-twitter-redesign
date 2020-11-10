class UsersController < ApplicationController
  before_action :set_user, only: %i[index show edit update destroy]
  before_action :set_user_opinions, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    login_required
    if params[:flag] == 'followers'
      @all_spesific_users = @user.followers.includes(:opinions)
    elsif params[:flag] == 'followed_users'
      @all_spesific_users = @user.followeds.includes(:opinions)
    end
    @flag = params[:flag]
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user.id), notice: 'User was successfully created and logged in!' }
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
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :destroy }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_user_opinions
    @timeline_opinions = @user.opinions.includes(:votes).order(created_at: :desc)
    @timeline_opinions
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end
