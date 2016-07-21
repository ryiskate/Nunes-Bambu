Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'home/index'
 
 #admin routes
 get 'admin/index'
 get 'admin/lamps'
 
 resources :lamps
 
 root 'home#index'
 
end
