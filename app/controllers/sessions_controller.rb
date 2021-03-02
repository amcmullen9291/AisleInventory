class SessionsController < ApplicationController

  def create

      if request.env['omniauth.auth']
        env.['omniauth.auth'].inspect
        uemail = request.env['omniauth.auth']['info']['email']

        if @user = User.find_by(:email => uemail)
          session[:user_id ] = @user_id
          redirect_to root_path, notic: "Welcome Back"
        else
          @user = User.find_or_create(:email => uemail, :password => "orangestarfish3vk", store_id =>"##5340620410", :employeeInit => "OTA" :telephone =>"7068818307") 
          if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, "Hello"
          else
            redirect_to 'users#new', notice: "create an account"
          end
        end
      else
        @user = User.find_by(:store_id => params[store_id])
        if @user && @user.authenticate(params[password])       
          session[:user_id] = @user.id
          redirect_to root_path, notice: "Welcome Back"
        else
          redirect_to new_users_path
        end
      end
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end

      private
     
      def auth
        request.env['omniauth.auth']
      end
end
