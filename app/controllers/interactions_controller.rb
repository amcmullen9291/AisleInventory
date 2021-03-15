class InteractionsController < ApplicationController
before_action :set_interaction, only: [ :show ]
    def new 
        @interaction = Interaction.new 
    end 

    def index   
        @interaction = Interaction.where(:employeeInit => @user.employeeInit) #needs more
    end

    def show
    end

    def create 
        @user = User.find_by(params[:id])
        @interaction = Interaction.new(interaction_params)
        if @interaction.save
            redirect_to interactions_path
        else
            render :new
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
        params.require(:interaction).permit(:employeeInit, :content, :id, :user_id)
    end
end
