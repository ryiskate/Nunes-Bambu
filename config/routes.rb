Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'home/index'
 
 #admin routes
 get 'admin/index'
 get 'admin/lamps'
 
 #users routes
 get 'signup' => 'users#new'
 resources :users
 
 
 resources :lamps
 
 root 'home#index'
 
end
