Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard', to: 'pages#dashboard'
  resources :products do
    resources :order_items, only: [:create]
  end
  resources :order_items, only: [:edit, :update, :destroy]
  resources :orders, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
