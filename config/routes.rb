Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'home/index'
 
 #users routes
 resources :users
 
 #lamps routes
 resources :lamps do
     resources :comments
 end
 
 root 'home#index'
 
end
