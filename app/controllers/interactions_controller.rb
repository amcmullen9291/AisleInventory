class InteractionsController < ApplicationController
before_action :set_interaction, except: [:new]
    def new 
        @interaction = Interaction.new 
    end 

    def index   
        @@notes = Note.find_by(:employeeInit => "#{@user.employeeInit}") #needs more
    end

    def show
    end

    def create 
        @@notes
        @interaction = Interaction.new(interaction_params)
        if @interaction.save
            @@notes.push.interaction
            redirect_to interaction_path(@interaction)
        end
    end 

    def error 
        flash.notice = "Wrong Location"
        redirect_to notes_error_path
    end 

    private 
    def set_interaction
        @user = User.find(params[:id])
    end 

    def interaction_params
        params.require(:interaction).permit(:employeeInit, :content, :user_id)
    end
end
