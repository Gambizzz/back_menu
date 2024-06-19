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

  resources :restaurants


  get "up" => "rails/health#show", as: :rails_health_check
end
