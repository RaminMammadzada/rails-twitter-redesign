class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You are successfully logged in!'
    else
      flash.now[:alert] = 'You username is not valid or cannot be blank!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are logged out!'
  end
end
