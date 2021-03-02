class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to roots_path, notice: "Welcome Back"
  end
    
    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end
  end
