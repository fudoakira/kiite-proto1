Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  resources :profiles
  resources :users, only: [:edit, :update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :tags do
    get "profiles", to: "profiles#search"
  end
end
