Rails.application.routes.draw do
  devise_for :reps
  resources :clients
  resources :pages
  resources :products

  root 'pages#index'
end
