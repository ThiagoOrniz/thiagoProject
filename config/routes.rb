Rails.application.routes.draw do
  devise_for :reps
  resources :clients
  resources :pages

  root 'pages#index'
end
