Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams
  resources :users, only: [:edit, :update]
  resources :items do
    resources :purchases
  end
end
