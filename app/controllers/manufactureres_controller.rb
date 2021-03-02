class ManufactureresController < ApplicationController
    before_action :set_manufacturer, only: [ :show, :edit, :destroy, :update ]

    def new 
        @manufacturer = Manufacturer.new
    end  

    def create 
        @manufacturer = Manufacturer.new(manufacturer_params)
        if @manufacturer.save 
            redirect_to cards_path, notice: "Manufacturer Added" 
        else 
            render :new
        end
    end 

    def index 
        @manufacturer = Manufacturer.all
    end 

    def edit
    end 

    def destory 
        @manufacturer.destroy
    end 

    def show
    end 

    def update 
        if @manufacturer.update(manufacturer_params)
            redirect_to cards_path, notice: "Item #{@manufacturer.name} Updated"
        else
            render :edit, notice: "record not updated"
        end

    end 


    private 

    def manufacturer_params 
        params.require(:manufacturer).permit(:name)
    end 

    def set_manufacturer 
        @manufacturer = Manufacturer.find(params[:id])
    end

end
