Rails.application.routes.draw do
  resources :users
  post 'auth/login', to: 'authentication#create'
  post 'auth/logout', to: 'authentication#destroy'

  root 'users#welcome'
end
