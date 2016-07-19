Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get 'software_architecture' => 'home#software_architecture'

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :questions

  resources :users do
    resources :questions, only: [:index]
  end

  resources :charges, only: [:create]

  resources :subscriptions, only: [:create, :new]
end
