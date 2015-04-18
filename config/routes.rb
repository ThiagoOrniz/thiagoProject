Rails.application.routes.draw do
  devise_for :reps
  resources :clients
  resources :pages, only: [:index]
  resources :products, only: [:index, :show]

  resources :sales do
  	resources :clients
  	resources :items
  	resources :products
  end
   
  root 'pages#index'
end
