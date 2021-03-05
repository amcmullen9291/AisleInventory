class NotesController < ApplicationController
    def new 
        @user = User.find_by(params[:id])
        @note = Note.new
    end

    def create  
        @note= Note.create(params)
        redirect_to 'sessions#logout'
    end

    def destroy 
    end 
end
