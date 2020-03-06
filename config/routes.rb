Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users, only: [:index,:show, :destroy] do
    member do
      get 'contact_show'
      put 'make_admin/:id' => 'users#make_admin', as: 'make_admin'
      put 'remove_admin/:id' => 'users#remove_admin', as: 'remove_admin'
    end
  end  

  resources :tasks 
  
  resource :sessions, only: [:show, :edit, :update]

end
