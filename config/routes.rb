Rails.application.routes.draw do

  resources :addresses  
  
  root 'products#index'
  resources :products 
 
  devise_for :users
end
