Rails.application.routes.draw do

  resources :rides, only: :create

  resources :attractions

  resources :users, except: [:destroy]

  root 'welcome#index'

  # resources :sessions, only: [:new, :create], as: 'login'
  get '/signin', to: "sessions#new", as: 'login'
  post '/signin', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout'
end
