Rails.application.routes.draw do
  get 'profiles/index'
  root to: "profiles#index"
end
