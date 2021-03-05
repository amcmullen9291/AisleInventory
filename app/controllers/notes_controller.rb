class NotesController < ApplicationController
    def new 
        @note = Note.new
    end

    def create  
        @note = Note.new(notes_params)
        if @note.save
            UserMailer.activity_report(current_user, params[:note][:content]).deliver_now

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
end
