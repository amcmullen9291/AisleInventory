Rails.application.routes.draw do
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
    end  
    resources :notes, only: [ :new ]
  end


  get '/login', to: 'users#sign_in'
  get "/signout" => "sessions#destroy", :as => :signout
  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'

  get '/search', to: 'cards#index' 
  get '/refresh', to: 'users#refresh'
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
