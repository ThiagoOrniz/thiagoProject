Rails.application.routes.draw do
  devise_for :reps
  resources :clients
  resources :pages
  resources :products
  resources :sales do
  	resources :clients
  	resources :items
  	resources :products
  end
  resources :items

  root 'pages#index'
end
