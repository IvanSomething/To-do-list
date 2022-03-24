# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tasks do
    member do
      get :toggle_status
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'tasks#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root to: 'tasks#index'
end
