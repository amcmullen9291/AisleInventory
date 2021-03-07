class SessionsController < ApplicationController
  before_action :set_user, only: [:logout]
  skip_before_action :authorize, only: [:new, :create]

  
  def new 
    if current_user 
      flash.notice = "you are already logged in"
      redirect_to user_error_path
    else 

    end 
  end 

  def create
    @session = session
    if auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      user = User.find_or_create_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render 'sessions/new'
      end
    end
  
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path, :notice => "Aisle Inventory - 2021  ©"
  end 

  private
  def set_user 
    @user = User.find(params[:id])
  end
end