Thestore::Application.routes.draw do

  resources :orders

  resources :line_items, :only => [:create, :destroy]
  resources :products
  resources :admins, :only => [:new, :create]
  resources :sessions

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  root :to => 'pages#index'
end
