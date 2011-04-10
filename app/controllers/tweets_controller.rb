class TweetsController < ApplicationController
  def index
    json = ::Twitter::Search.new.hashtag("ThankyouWorld").hashtag(params[:q]).fetch
    render :json => json
  end

  def create
    twitter.update(params[:tweet_content])
    redirect_to root_url, :notice => "Thanks to the world!"
  end
end
