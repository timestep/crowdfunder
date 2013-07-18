Crowdfunder::Application.routes.draw do
 	get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

  root 'projects#index'

  resources :projects
  resources :users
  resources :sessions
  
end
