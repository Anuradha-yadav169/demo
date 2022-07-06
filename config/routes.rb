Rails.application.routes.draw do

  resources :addresses  
  
  root 'home#index'
  resources :products 
 
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
end
