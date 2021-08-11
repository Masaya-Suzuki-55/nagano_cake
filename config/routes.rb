Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #device
  
  devise_for :admin, controllers: {
  sessions: 'admin/sessions'
  }
  root :to => 'public/homes#top'
  
  #admin
  namespace :admin do
    
  root :to => 'homes#top'
  resources :admins
  resources :products
  resources :customers
  resources :orders
  resources :order_details, only:[:update]
  resources :genres
  
  end
  #admin
  
  #public
  #public
end