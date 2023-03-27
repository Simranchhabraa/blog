Rails.application.routes.draw do
  resources :whishlists
  resources :orders
  resources :idproofs
  resources :categories
  resources :carts do
    member do
      get :add_order, to: 'orders#create'
      get :remove_from_cart, to: 'carts#destroy'
      
    end
  end
  #get 'products/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :merchants
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  # root to: "products#index"

  resources :whishlists do
    member do
      get :remove_from_whishlist, to: 'whishlists#destroy'
      get :add_order, to: 'orders#create'

    end
  end
  resources :products do
    member do
    
      get :whishlist, to: 'whishlists#create'
      get :cart, to: 'carts#cart'

    end
    resources :product_images
  end
end
