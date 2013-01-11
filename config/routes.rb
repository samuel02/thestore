Thestore::Application.routes.draw do

  get "empty_cart" => "carts#destroy", :as => "empty_cart"

  resources :orders
  resources :line_items, :only => [:create, :destroy]
  resources :products
  resources :admins, :only => [:new, :create]
  resources :sessions
  resources :customers, :only => [:index, :create, :show, :update]
  resources :comments, :only => [:new, :create]

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  root :to => 'pages#index'
end
