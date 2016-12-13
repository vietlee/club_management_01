Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {registrations: "registrations"}
  root "static_pages#index"
  resources :club_requests
  resources :users
  namespace :admin do
    resources :organizations
  end
  resources :organizations, only: :show
end
