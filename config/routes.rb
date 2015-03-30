Rails.application.routes.draw do
  devise_for :reps
  resources :clients

  root 'clients#index'
end
