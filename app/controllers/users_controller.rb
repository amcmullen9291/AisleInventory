class UsersController < ApplicationController
    def welcome 
        flash.notice = "Aisle Inventory - 2021  ©"
   end 

   def new 
       @user = User.new
   end

   def create 
       @user = User.new(user_params)
       if @user.save
           UserMailer.aisle_inventory.deliver_now
           session[:user_id] = @user.employeeInit
           redirect_to cards_path, notice: "Welcome"
       else
           render :new, notice: "Access Denied"
       end
   end 

   private 

   def user_params 
       params.require(:user).permit(:password, password_confirmation, :store_id, :notes, :employeeInit, :password_digest, :telephone, :uid, :uname, :uemail)
   end     
end
