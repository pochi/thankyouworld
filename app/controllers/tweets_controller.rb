class TweetsController < ApplicationController
  before_filter :login_required, :only => %w(create)

  def index
    json = ::Twitter::Search.new.hashtag("ThankyouWorld").hashtag(params[:q]).fetch
    render :json => json
  end

  def create
    logger.info("***"*20)
    render :json => { success: true }.to_json
  end
end
