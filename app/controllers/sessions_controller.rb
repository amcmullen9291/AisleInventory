class SessionsController < ApplicationController

    def new 
    end 

    def create
        @usuer = User.find_by_store_id(:store_id => params[:store_id])

        if @user && @user.authenticate(params[password)
        @user = User.find_or_create_by(uid: auth['uid']) 
        session[:user_id] = @user.employeeInit
        
        do |u|
          uname = auth['name']
          uemail = auth['email']
        end
     
        session[:user_id] = @user.id
     
        render 'welcome/home', notice: "Hello"
      end
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
end
