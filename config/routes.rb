Rails.application.routes.draw do
  devise_for :users
  get 'shipping_addresses/index'
  get 'shipping_addresses/new'
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end

  resources :users, only: [:show, :update]
end
