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

  def consumer
    @consumer ||= ::OAuth::Consumer.new(ENV["TWITTER_CONSUMER_KEY_FOR_THANKYOU"], ENV["TWITTER_CONSUMER_SECRET_FOR_THANKYOU"], :site => "http://twitter.com")
  end
end
