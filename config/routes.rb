Rails.application.routes.draw do
  root to: 'users#welcome'

  resources :sessions
  resources :cards 
  resources :occasions, except: [:show]
  resources :aisles, except: [ :show ]

  resources :manufactureres
  resources :users do
    member do
      get :confirm_email
      resources :interactions, only: [:new, :show, :index, :update]
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
  post '/users/:id', to: 'users#show'
  post '/users/:id/interactions', to: 'interactions#create'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html', to

    match "/404", :to => "application#error_page", :via => :all
    match "/500", :to => "application#error_page", :via => :all
  end
