Rails.application.routes.draw do

  # get 'cart_items#index'
  # get '/cart_items/:id', to: 'cart_items#show'
  # get '/cart_items/:id', to: 'cart_items#index'
  # get '/cart_items/:id', to: 'cart_items#show', as: 'cart_items'
  # get '/cart_items/:id', to: 'cart_items#index', as: 'cart_items'


  #get 'cart_items#show'
  # get 'cart_items/new'
  # get 'cart_items/create'
  resources :addresses 
  #resources :cart_items

  # get 'cart_items/index' => 'cart_items#index'
  # get 'cart_items/show' => 'cart_items#show'

  # get 'cart_items/index', to:'cart_items/index'
  # get 'cart_items/show', to:'cart_items/show'
  
  root 'home#index'
  # resources :products

  resources :products 
  resources :cart_items, only: [:show, :destroy]


  # resources :products do
  #   resources :cart_items, only: [:index, :new, :create]
  # end
  # resources :cart_items, only: [:show]


  post '/cart_items/:product_id' => 'cart_items#create', :as => 'cart_items'
  # get '/cart_items/:product_id' => 'cart_items#show', :as => 'cart_items'
  # get '/cart_items/:product_id' => 'cart_items#index', :as => 'cart_items'
  
  
  

  # post'cart_items/create'

  # line_item_path GET  /line_items/1     line_items#show
  
  # POST  /cart_items/:cart_items_id/


  # resources :cart_items 
  # resources :products do
  #   put :add_to_cart, on: :member
  # end
  #post '/add_to_cart/:product_id' => 'cart_items#add_to_cart', :as => 'add_to_cart'
  # post 'products/cart_item/:id', to: 'products#cart_item', as: 'cart_item'
  # delete'products/remove_from_cart/:id', to: 'products#remove_from_ cart', as: 'remove_from_cart'

 
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  # get 'cart_items/:id' => "cart_items#show", as: "cart_items"
  # delete 'cart_items/:id' => "cart_items#destroy"
end
