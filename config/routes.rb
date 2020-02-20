Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create], path_names: {new: 'signup'}

  resources :tasks 
  
  resource :sessions, only: [:new, :create], path_names: { new: 'login'} do
    member do
      delete :logout
    end
  end 
end
