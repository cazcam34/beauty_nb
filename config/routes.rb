Rails.application.routes.draw do
  devise_for :views
  devise_for :users

  authenticated do
  	root :to => 'pages#dashboard', as: :authenticated
	end

	root to: 'pages#home'

  resources :products do
    resources :order_items, only: [:create]
    resources :favorites, only: [:create]
  end
  resources :order_items, only: [:edit, :update, :destroy]
  resources :orders, only: [:show]
  resources :favorites, only: [:edit, :update, :destory]

  patch 'orders/:id', to: 'orders#checkout', as: :orders_checkout
  get 'orders/:id/complete', to: 'orders#complete', as: :orders_complete
  get 'wishlist', to: 'pages#wishlist', as: :favorites
end
