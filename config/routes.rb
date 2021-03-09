Rails.application.routes.draw do
  resources :interactions
  root to: 'users#welcome'
  resources :sessions
  resources :cards 
  resources :occasions, except: [:show]
  resources :aisles
  resources :occasions

  resources :manufactureres
  resources :users do
    member do
      get :confirm_email
      post :confirm_email
    end  
  end

  resources :notes 

  get "/signout" => "sessions#destroy", :as => :signout
  get '/signup', to: 'users#new'
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get '/search', to: 'cards#index' 
  get '/refresh', to: 'users#refresh'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/google_oauth2'
  get '/registration', to: 'users#registration'
  get '/user_error', to: 'users#user_error'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html', to
  end
