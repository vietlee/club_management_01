Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users, controllers: {registrations: "registrations", sessions: "authentications"}
  devise_for :admin, controllers: {sessions: "admin/sessions"}

  devise_scope :admin do
    get "/admin/sign_in" => "admin/sessions#new", as: :new_admin_sessions
    delete "/admin/sign_out" => "admin/sessions#destroy", as: :destroy_admin_sessions
  end

  namespace :admin do
    get "/" => "static_pages#index"
    resources :users
    resources :organizations, except: [:edit, :update, :destroy]
    resources :organization_requests
  end
  namespace :manager do
    root "static_pages#index"
  end

  resources :users do
    resources :club_requests, only: [:new, :create, :index]
  end
  resources :clubs, only: :show do
    resources :events, only: :show
  end

  resources :organizations, only: :show
end
