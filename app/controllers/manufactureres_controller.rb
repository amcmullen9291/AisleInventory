class ManufactureresController < ApplicationController
    before_action :set_manufacturere, only: [ :show, :edit, :destroy, :update ]

    def new 
        @manufacturere = Manufacturere.new
    end  

    def create 
        @manufacturere = Manufacturere.new(manufacturere_params)
        if @manufacturere.save 
            redirect_to cards_path, notice: "Manufacturer Added" 
        else 
            render :new
        end
    end 

    def index 
        @manufactureres = Manufacturere.all
    end 

    def edit
    end 

    def destory 
        @manufactureree.destroy
    end 

    def show
    end 

    def update 
        if @manufacturere.update(manufacturere_params)
            redirect_to cards_path, notice: "#{@manufacturere.name} Updated"
        else
            render :edit, notice: "record not updated"
        end

    end 


    private 

    def manufacturere_params 
        params.require(:manufacturere).permit(:name)
    end 

    def set_manufacturere 
        @manufacturere = Manufacturere.find(params[:id])
    end

end
