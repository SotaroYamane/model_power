class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(uid: session[:user_id])
    end
  end

  def unless_user
    unless @current_user
      redirect_to root_path
    end
  end

  helper_method :current_user
end
