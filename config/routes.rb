Thestore::Application.routes.draw do
  resources :products
  resources :admins, :only => [:new, :create]

  root :to => 'pages#index'
end
