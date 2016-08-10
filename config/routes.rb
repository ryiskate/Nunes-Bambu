Rails.application.routes.draw do

  get 'rates/new'

  get 'rates/update'

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
     resources :rates
 end
 
 #Kitchenwares routes
 resources :kitchenwares do
     resources :comments
     resources :rates
 end
 
 #comments routes
 resources :comments do
   resources :replies
 end
 
 #replies routes
 resources :replies
 
 root 'home#index'
 
end
