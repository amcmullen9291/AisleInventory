class UsersController < ApplicationController
    
before_action :set_user, only: [:show, :edit, :update, :destroy]
skip_before_action :authorize, only: [ :welcome, :new, :create ]
before_action :owner_rights, only:[:refresh, :registration]

    def welcome 
        case 
        when User.first
            redirect_to  login_path
        else 
            redirect_to new_user_path
        end
   end 

   def new 
    @user = User.new
   end

   def create
        @user = User.new(user_params)
        if @user.save 
            if @user.first?(@user)
                UserMailer.registration_confirmation(@user).deliver_now
            end               
            session[:user_id] = @user.id
            redirect_to new_interaction_path(@user), :notice => "Welcome"
        else 
            redirect_to new_user_path
        end
    end 
   
   def show 
   end 

   def edit 
   end 

   def update
        if @user.update(user_params)
            redirect_to user_path(user)
        else
            render :edit
        end 
    end 

   def sign_in 
   end 

   def registration
        if @user = User.first
        @user = User.new
        else
            redirect_to root_path
             flash.notice = "you are not authorized to add accts."
        end 
    end 

    def user_error 
    end 

   def refresh 
        User.destroy_all
        redirect_to root_path 
        flash.notice = "Account has been reset! Register Email."
   end

   def removeUser 
    flash.notice = "WARNING"
   end 

   def destroy
    session[user_id] = nil
    @user.destroy 
    flash.notice = "Users Updated"
    redirect_to root_path
   end 

   private 

   def set_user
    @user = User.find(params[:id])
   end

   def user_params 
       params.require(:user).permit(:password, :password_confirmation, :store_id, :notes, :employeeInit, :password_digest, :telephone, :uid, :uname, :uemail, :email, :admin_Init)
   end     

   def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            redirect_to 'sign_in_path'
            flash.notice = "Welcome to the Aisle Inventory!"

        else
            flash.error = "Sorry. User does not exist"
            redirect_to root_url
        end
    end

    def owner_rights 
         User.first 
    end        
end
