class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if user_id = session[:user_id]
      User.find(user_id)
    else
      User.first
    end
  end
  helper_method :current_user
end
