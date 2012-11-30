Thestore::Application.routes.draw do
  resources :products
  resources :admins, :only => [:new, :create]

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  root :to => 'pages#index'
end
