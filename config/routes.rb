Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users, only: [:show]

  resources :tasks 
  
  resource :sessions, only: [:show, :edit, :update]

end
