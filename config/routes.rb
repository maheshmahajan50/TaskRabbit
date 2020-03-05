Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users, only: [:index,:show, :destroy] do
    member do
      get 'contact_show'
    end  
  end  

  resources :tasks 
  
  resource :sessions, only: [:show, :edit, :update]

end
