class SessionsController < ApplicationController
  before_action :set_user, only: [:logout]
  
  def new 
  end 

  def create
    @session = session
    @user = User.find_by(:employeeInit => params[:employeeInit])
      if @user && @user.authenticate(params[:password])
        @session[:user_id] = @user.id
        flash[:notice] = "Signed in as #{@user.employeeInit.upcase}"
        redirect_to cards_path
      else
    flash[:error] = "Enter AccessID and StoreID."
    render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path, notice: flash.notice = "Aisle Inventory - 2021  ©"
  end 

  private
  def set_user 
    @user = User.find(params[:id])
  end
end