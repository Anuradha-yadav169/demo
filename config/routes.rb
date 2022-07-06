Rails.application.routes.draw do

  get 'cart_items/index'
  get 'cart_items/show'
  get 'cart_items/new'
  resources :addresses  
  
  root 'home#index'
  resources :products 
 
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  post '/add_to_cart_items/:product_id' => 'cart_items#add_to_cart_item', :as => 'add_to_cart_item'

  resources :cart_items


end
