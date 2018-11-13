Rails.application.routes.draw do
  devise_for :users

  authenticated do
  	root :to => 'pages#dashboard', as: :authenticated
	end

	root to: 'pages#home'

	# root :to => 'home#static_page'

 #  get '/dashboard', to: 'pages#dashboard'
  resources :products do
    resources :order_items, only: [:create]
  end
  resources :order_items, only: [:edit, :update, :destroy]
  resources :orders, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
