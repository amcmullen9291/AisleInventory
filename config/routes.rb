Rails.application.routes.draw do
  root to: 'users#welcome'

  resources :sessions
  resources :cards 
  resources :occasions
  resources :aisles

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
  get '/auth/google_oauth2'
  post '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get '/registration', to: 'users#registration'
  get '/user_error', to: 'users#user_error'
  post '/users/:id', to: 'users#show'
  post '/users/:id/interactions/new', to: 'interactions#create'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html', to

    match "/404", :to => "application#error_page", :via => :all
    match "/500", :to => "application#error_page", :via => :all
  end
