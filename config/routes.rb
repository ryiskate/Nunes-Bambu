Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders
  
  resources :products
  
  resources :categories
 
  #comments routes
  resources :comments do
    collection do
      get 'for_product/:product_id', to: 'comments#for_product'
    end
  end
  
  
  resources :rates
 
 root 'home#index'
 
end
