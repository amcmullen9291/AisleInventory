class NotesController < ApplicationController
    def new 
    end

    def create  
        @note= Note.create(params)
        redirect_to 'sessions#logout'
    end

    def destroy 
    end 
end
