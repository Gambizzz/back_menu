Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords" 
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations",
    passwords: "admins/passwords" 
  }

  resources :restaurants do
    resources :reservations
  end
  
  post '/api/save-text', to: 'api/texts#create'

  namespace :api do
    resources :texts, only: [:create]
    get 'texts/show', to: 'texts#show'
    get 'texts/public', to: 'texts#public_texts'
    get 'latest-text', to: 'texts#show_latest'
  end

  resources :users, only: [:show, :update, :destroy]

  resources :admins, only: [:update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
