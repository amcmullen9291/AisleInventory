class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    @user = User.sign_in_from_omniauth(auth)
    self.current_user = @user
    session[:user_id] = @user.name
    UserMailer.activity(@user).deliver!
    redirect_to roots_path, notice: "Welcome Back"
  end
    
    def destroy
      @user = User.find(params[:id])
      @user.notes.destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end

  end
