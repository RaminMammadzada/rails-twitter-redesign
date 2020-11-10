module ApplicationHelper
  def current_user
    return nil if session[:user_id].nil?

    user = User.find(session[:user_id])
    return user if user
  end
end
