Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  resources :profiles
  resources :users, only: [:edit, :update]
end
