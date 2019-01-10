Rails.application.routes.draw do
  root 		'home#index'
  resources :invitation_relations,  :only => [:index, :show, :update]
  resources :groups,                :except => [:index, :destroy, :patch]
  resources :group_relations,       :only => [:index, :show, :create]
  resources :group_invitations,     :only => [:index, :create, :update]
  resources :users
  resources :invitations,           :only => [:index, :create, :new, :update]
  resources :sessions,              :only => [:create, :destroy, :new]
end
