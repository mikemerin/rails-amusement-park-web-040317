Rails.application.routes.draw do

  resources :rides

  resources :attractions

  resources :users, except: [:index, :destroy]

  root 'welcome#index'

  # resources :sessions, only: [:new, :create], as: 'login'
  get '/login', to: "sessions#new", as: 'login'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#create", as: 'logout'

end
