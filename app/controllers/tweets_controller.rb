class TweetsController < ApplicationController
  def index
    json = ::Twitter::Search.new.hashtag("ThankyouWorld").hashtag(params[:q]).fetch
    render :json => json
  end
end
