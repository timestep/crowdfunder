Crowdfunder::Application.routes.draw do
  get "sessions/new"
  root 'projects#index'
  resources :projects
  resources :users
end
