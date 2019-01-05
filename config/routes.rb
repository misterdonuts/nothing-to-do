Rails.application.routes.draw do
  root 		'home#index'
  post   	'/login',   to: 'sessions#create'
  delete 	'/logout',  to: 'sessions#destroy'
  get		  '/kanji',	  to: 'invitations#kanji'
  put	    '/kanji',	  to: 'invitations#kanjiUpdate'
  resources :invitation_relations,  :only => [:index, :show, :update]
  resources :groups,                :except => [:index, :destroy, :patch]
  resources :group_relations,       :only => [:index, :show, :create]
  resources :group_invitations,     :only => [:index, :create, :update]
  resources :users
  resources :invitations,           :only => [:index, :create]
  resources :sessions,              :only => [:create, :destroy, :new]
end
