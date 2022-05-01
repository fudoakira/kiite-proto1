Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  resources :profiles do
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update] do
    get :favorites, on: :collection
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :tags do
    get "profiles", to: "profiles#search"
  end
end
