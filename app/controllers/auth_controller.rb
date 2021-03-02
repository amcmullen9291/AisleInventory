class AuthController < ApplicationController
    def github 
        redirect_to 'sessions#create'
    end 

    def create 
        redirect_to 'sessions#create'
    end 


    private
     
    def auth
      request.env['omniauth.auth']
    end

end