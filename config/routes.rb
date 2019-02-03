# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/logout',	to: 'sessions#destroy'
  match '/auth/google_oauth2/callback', to: 'sessions#create', via: %i[get post]
  resources :invitation_relations,  only: %i[index show update]
  resources :groups,                except: %i[index destroy patch]
  resources :group_relations,       only: %i[index show create]
  resources :group_invitations,     only: %i[index create update]
  resources :users, except: [:destroy]
  resources :invitations,           only: %i[index create new update]
  resources :sessions,              only: %i[create destroy new]
end
