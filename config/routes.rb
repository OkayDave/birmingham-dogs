Rails.application.routes.draw do

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  resources :dogs, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :breeds, only: [:index, :show]

  root to: 'visitors#index'
end
