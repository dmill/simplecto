Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get "guide-to-web-applications" => "home#guide_to_web_applications"

  get "software-architecture" => "home#software_architecture"

  get "development" => "home#development"

  get "tech-lingo" => "home#tech_lingo"

  get "consultation" => "home#consultation"

  get "30-minutes" => "home#30"

  get "1-hour" => "home#60"

  get "architecture-document" => "home#architecture_document"

  get "privacy_policy" => "home#privacy_policy"

  get "quote" => "home#quote"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :questions

  resources :users do
    resources :questions, only: [:index]
  end

  resources :charges, only: [:create]

  resources :subscriptions, only: [:create, :new]
end
