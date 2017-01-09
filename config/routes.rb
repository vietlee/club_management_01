Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations", sessions: "authentications"}
  devise_for :admin, controllers: {sessions: "admin/sessions"}
  devise_scope :admin do
    get "/admin/sign_in" => "admin/sessions#new", as: :new_admin_sessions
    delete "/admin/sign_out" => "admin/sessions#destroy", as: :destroy_admin_sessions
  end

  root "static_pages#index"
  resources :users do
    resources :club_requests, only: [:new, :create, :index]
    resources :clubs, only: :show do
      resources :events, only: :show
    end
  end
  namespace :admin do
    get "" => "static_pages#index"
    resources :organizations
  end
  namespace :manager do
    root "static_pages#index"
  end
  resources :organizations, only: :show

end
