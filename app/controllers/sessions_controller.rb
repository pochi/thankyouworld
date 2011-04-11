class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    if user.oauth
      redirect_to root_url, :notice => "Signed in!"
    else
      redirect_to request_token_url
    end
  end

  def request_token
    callback_url = url_for :callback
    request_token = consumer.get_request_token(:oauth_callback => callback_url)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end

  def callback
    request_token = ::OAuth::RequestToken.new(consumer,
                                              session[:request_token],
                                              session[:request_token_secret])
    access_token = request_token.get_access_token({ },
                                                  :oauth_token => params['oauth_token'],
                                                  :oauth_verifier => params['oauth_verifier'])

    # refactoring: use build_oauth
    oauth = Oauth.new
    oauth.access_token = access_token.token
    oauth.access_token_secret = access_token.secret
    oauth.user_id = current_user.id
    oauth.save

    redirect_to root_url, :notice => "Create new user"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
