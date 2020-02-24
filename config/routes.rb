Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, 
  only: [:new, :create, :show], 
  path_names: {new: 'signup'}

  resources :tasks 
  
  resource :sessions,
   only: [:new, :create, :show, :edit, :update], 
   path_names: { new: 'login'} do
    member do
      delete :logout
    end
  end 
end
