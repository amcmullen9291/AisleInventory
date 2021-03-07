class NotesController < ApplicationController
    skip_before_action :authorize
    before_action :set_user, only: [:new]

    def new 
        @note = Note.new
        flash.notice = "Report And Signature Req."
    end

    def create  
        @note = Note.new(notes_params)
        if @note.save
            UserMailer.activity_report(User.first.email, User.first.store_id,  params[:note][:content], params[:note][:employeeInit]).deliver_now

            redirect_to signout_path
        else 
            redirect_to new_note_path, :notice => "Comments and Signature Req."
        end
    end

    def destroy 
        @note.destroy
    end 

    private 
    def notes_params 
        params.require(:note).permit(:employeeInit, :content)
    end

    def set_user 
        @user = User.find(current_user.id)
    end
end
