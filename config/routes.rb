Rails.application.routes.draw do
  

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  root 'users#new'
  resources :users
  resources :tasks

  # resources :categories


	# This routes not working for add new task and edit task
  # resources :users do
  # 	member do
  # 		get 'edit'
  # 		get 'show'
  # 		patch 'update'
  # 		put 'update'
  # 		delete 'destroy'
  # 	end	
  # 	collection do
  # 		get 'index'
  # 		post 'index'
  # 		post 'create'
  # 		get 'new'
  # 	end
  # end

  # resources :tasks do
  # 	member do
  # 		get 'edit'
  # 		get 'show'
  # 		patch 'show'
  # 		patch 'update'
  # 		put 'update'
  # 		delete 'destroy'
  # 	end
  # 	collection do
  # 		get 'index'
  # 		post 'index'
  # 		post 'create'
  # 		get 'new'
  # 	end	
  # end

  # resources :categories do
  # 	member do
  # 		get 'edit'
  # 		get 'show'
  # 		patch 'update'
  # 		put 'update'
  # 		delete 'destroy'
  # 	end	
  # 	collection do
  # 		get 'index'
  # 		post 'create'
  # 		get 'new'
  # 	end
  # end	
  
  
end
