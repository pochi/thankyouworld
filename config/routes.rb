Thankyouworld::Application.routes.draw do
  resources :tweets

  get "welcome/index", :controller => 'welcome', :action => 'index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/request_token" => "sessions#request_token", :as => :request_token
  match "/callback" => "sessions#callback", :as => :callback
  root :to => "welcome#index"
end
