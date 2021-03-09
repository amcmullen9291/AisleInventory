class InteractionsController < ApplicationController
before_action :set_interaction, except: [:new]
    def new 
        @interaction = Interaction.new 
    end 

    def index
        @user = User.find(:id)
        @interaction = Interaction.where(employeeInit: "@user.employeeInit") #needs more
    end

    def show
    end

    def create 
        @interaction = Interaction.new(interaction_params)
        if @interaction.save

            redirect_to interaction_path(@interaction)
        end
    end 

    private 
    def set_interaction
        @user = User.fine(params[:id])
    end 

    def interaction_params
        params.require(:interaction).permit(:employeeInit, :content, :user_id)
    end
end
