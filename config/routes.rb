Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :questions

  resources :users do
    resources :questions, only: [:index]
  end

  resources :charges, only: [:create, :index]
end
