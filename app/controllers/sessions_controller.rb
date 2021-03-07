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
    @user = User.find_by(:employeeInit => params[:employeeInit])
      if @user && @user.authenticate(params[:password])
        @session[:user_id] = @user.id
        flash.notice = "Signed in as #{@user.employeeInit.upcase}"
        redirect_to cards_path
      else
      flash.notice = "Enter AccessID and StoreID."
      render :new
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