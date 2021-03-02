Rails.application.routes.draw do
  root to: 'users#welcome'
  resources :cards
  resources :occasions
  resources :aisles
  resources :manufactureres
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
