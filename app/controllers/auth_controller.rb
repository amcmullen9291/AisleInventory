class AuthController < ApplicationController
  
    def new 
    end 

    def create 
    end 

    private
     
    def auth
      request.env['omniauth.auth']
    end

end