Rails.application.routes.draw do

  resources :rides

  resources :attractions

  resources :users, except: [:index, :destroy]

  root 'welcome#index'

end
