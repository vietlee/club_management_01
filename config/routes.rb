Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations", sessions: "authentications"}
  root "static_pages#index"
  resources :users do
    resources :club_requests, only: [:new, :create, :index]
    resources :clubs, only: :show do
      resources :events, only: :show
    end
  end
  namespace :admin do
    root "static_pages#index"
    resources :organizations
  end
  namespace :manager do
    root "static_pages#index"
  end
  resources :organizations, only: :show

end
