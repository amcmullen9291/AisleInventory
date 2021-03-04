class UsersController < ApplicationController
    def welcome 
        flash.notice = "Aisle Inventory - 2021  ©"
   end 

   def new 
       @user = User.new
   end

   def create 
    session = @session
       @user = User.new(user_params)
       if @user.save
        UserMailer.registration_confirmation(@user).deliver!
        @session[:user_id] = @user.employeeInit
           redirect_to root_path, notice: "Welcome"
       else
           render :new, notice: "Access Denied"
       end
   end 

   private 

   def user_params 
       params.require(:user).permit(:password, password_confirmation, :store_id, :notes, :employeeInit, :password_digest, :telephone, :uid, :uname, :uemail)
   end     
end
