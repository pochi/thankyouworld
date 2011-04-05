Thankyouworld::Application.routes.draw do
  get "tweets/index"

  get "welcome/index", :controller => 'welcome', :action => 'index'
end
