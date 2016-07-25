Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'home/index'
 
 #admin routes
 get 'admin/index'
 get 'admin/lamps'
 
 #users routes
 get 'signup' => 'users#new'
 resources :users
 
 #session routes
 get 'login' => 'sessions#new'
 post 'login' => 'sessions#create'
 delete 'logout' => 'sessions#destroy'
 
 resources :lamps
 
 root 'home#index'
 
end
