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
    end 

    private 
    def set_interaction
        @user = User.fine(params[:id])
    end 
end
