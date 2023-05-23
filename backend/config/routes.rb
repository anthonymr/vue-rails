Rails.application.routes.draw do
  resources :users
  post 'auth', to: 'authentication#create'
  delete 'auth', to: 'authentication#destroy'

  root 'users#welcome'
end
