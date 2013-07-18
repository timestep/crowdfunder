Crowdfunder::Application.routes.draw do
  root 'projects#index'
  resources :projects
  resources :users
end
