Crowdfunder::Application.routes.draw do
 	get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

  

  resources :projects do
 		resources :pledges, only: [:new, :create]
 	end

  resources :users, except: [:index]
  resources :sessions, :only => [:new, :create, :destroy]

  root 'projects#index'

end
