class AislesController < ApplicationController
     before_action :set_aisle, only: [ :show, :edit, :destroy, :update ]

    def new 
        @aisle = Aisle.new
    end 

    def create 
        @aisle = Aisle.new(aisle_params)
        params[:aisle][:occasion] = @aisle.build_occasion(:name_of)
     
        if @aisle.save 
            redirect_to root_path, notice: "Aisle #{@aisle.aisle_number} added"
        else 
            render :new, notice: "Aisle #{@aisle.aisle_number} was not added"
        end
    end 

    def destroy 
    end 

    def show 
    end 

    def update
        if @aisle.update(aisle_params)
            redirect_to root_path, notice: "update recorded"
        else
            render :edit
        end
    end 

    private 

    def aisle_params 
        params.require(:aisle).permit(:aisle_number)
    end

    def set_aisle 
        @aisle = Aisle.find(params[:id])
    end 

end
