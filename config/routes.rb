Thankyouworld::Application.routes.draw do
  resources :tweets

  get "welcome/index", :controller => 'welcome', :action => 'index'

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => "welcome#index"
end
