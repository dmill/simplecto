Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get "software-architecture" => "home#software_architecture"

  get "consultation" => "home#consultation"

  get "30-minutes" => "home#30"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :questions

  resources :users do
    resources :questions, only: [:index]
  end

  resources :charges, only: [:create]

  resources :subscriptions, only: [:create, :new]
end
