Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_CONSUMER_KEY_FOR_THANKYOU"], ENV["TWITTER_CONSUMER_SECRET_FOR_THANKYOU"]
end
