Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#index"
  resources :club_requests
  resources :users
  namespace :admin do
    root "static_pages#index"
    resources :organizations
  end
  namespace :manager do
    root "static_pages#index"
  end
  resources :organizations, only: :show
end
