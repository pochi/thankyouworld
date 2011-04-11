class WelcomeController < ApplicationController
  def index
    logger.info "---"*20
    logger.info session.inspect
    logger.info "---"*20

  end
end
