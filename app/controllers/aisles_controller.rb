class AislesController < 
    before_action :set_aisle, only: [ :show, :edit, :destroy, :update ]

    def new 
        @aisle = Aisle.new
    end 

    def create 
        @aisle = Aisle.new(aisle_params) 
        if @aisle.save 
            redirect_to root_path, notice: "Aisle added"
        else 
            render :new 
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
