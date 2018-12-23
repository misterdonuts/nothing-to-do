Rails.application.routes.draw do
  root 		'users#index'
  get    	'/login',   to: 'sessions#new'
  post   	'/login',   to: 'sessions#create'
  delete 	'/logout',  to: 'sessions#destroy'
  get		'/signup',	to: 'users#new'
  post 		'/signup',  to: 'users#create'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  resources :users
  resources :invitations
  get '/invitations', to: 'invitations#get'
  post '/invitations', to: 'invitations#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
