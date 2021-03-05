class SessionsController < ApplicationController
  before_action :set_user, only: [:logout]
  
  def new 
  end 

  def create
    @user = User.find_by(:employeeInit => params[:employeeInit])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "Signed in."
        redirect_to cards_path
      else
    flash[:error] = "Enter AccessID and StoreID."
    render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_path, notice: "Thank You"
  end 

  private
  def set_user 
    @user = User.find(params[:id])
  end
end