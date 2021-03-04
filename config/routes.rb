Rails.application.routes.draw do
  root to: 'users#welcome'
  resources :cards 
  resources :occasions, except: [:show]
  resources :aisles
  resources :occasions

  resources :manufactureres
  resources :users do
    member do
      get :confirm_email
    end  
    resources :notes, only: [ :new ]
  end


  get '/login', to: 'users#sign_in'
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  get '/auth/github'
  get '/signup', to: 'users#new'

  get '/search', to: 'cards#index' 
  get '/refresh', to: 'users#refresh'
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
