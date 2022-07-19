Rails.application.routes.draw do

  resources :addresses 
 
 
  
  root 'home#index'
  # resources :products

  resources :products 
  post '/cart_items/:product_id' => 'cart_items#create', :as => 'cart_items'
  resources :cart_items, only: [:index, :show, :destroy]


  

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
end
