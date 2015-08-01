Rails.application.routes.draw do

  resources :dogs, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :breeds, only: [:index, :show]

  root to: 'visitors#index'
end
