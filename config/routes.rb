Rails.application.routes.draw do
  get 'adresses/index'
  get 'adresses/show'
  get 'adresses/new'
  get 'adresses/create'
  get 'adresses/edit'
  get 'adresses/update'
  get 'adresses/destroy'
  resources :addresses  
  root 'addresses#index'  


  devise_for :users

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # root to: 'pages#index'
  # root to: 'product#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
