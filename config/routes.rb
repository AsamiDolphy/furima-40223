Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'shipping_addresses/index'
  get 'shipping_addresses/new'
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end

  # resources :users, only: [:edit, :update]
  resources :cards, only: [:new, :create]
end
