Rails.application.routes.draw do
  devise_for :users
  get 'shipping_addresses/index'
  get 'shipping_addresses/new'
  root to: 'items#index'
  resources :items
end
