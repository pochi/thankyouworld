class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to '/auth/twitter' unless current_user
  end
end
