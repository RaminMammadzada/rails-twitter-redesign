class ApplicationController < ActionController::Base
  def get_current_user
    User.find(session[:user_id])
  end

  def login_required
    redirect_to login_path, notice: 'Login required' if !session[:user_id]
  end
end
