Thestore::Application.routes.draw do
  resources :products

  root :to => 'pages#index'
end
