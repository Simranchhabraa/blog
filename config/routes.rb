Rails.application.routes.draw do
  resources :idproofs
  resources :categories
  #get 'products/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :merchants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  # root to: "products#index"
  resources :products do
    resources :product_images
  end
end
