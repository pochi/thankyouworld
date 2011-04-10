class TweetsController < ApplicationController
  def index
    json = ::Twitter::Search.new.hashtag("ThankyouWorld").hashtag(params[:q]).fetch
    render :json => json
  end

  def create

    render :json => { success: true }.to_json
  end

  private
  def client
  end
end
