class OccasionsController < ApplicationController
    before_action :set_occasion, only: [ :show, :edit, :destroy, :update ]

    def index 
        @occasion = Occasion.all
    end 

    def new 
        @occasion = Occasion.new
    end 

    def create 
        @occasion = Occasion.new(occasion_params)
        if @occasion.save 
            redirect_to new_occasion_path, notice: "Occasion Added" 
        else 
            redirect_to new_occasion_path, notice: "Occasion Not Added"
        end
    end 

    def show 
    end 

    def edit 
    end 

    def update 
    end 

    def destroy
    end 

    private 

    def occasion_params 
        params.require(:occasion).permit(:name_of)
    end 
    
    # probably not needed...
    def occasion_name=(name)
        self.occasion = Occasion.find_or_create(:name => name)
        self.occasion << occasion 
    end 

    def set_occasion 
        @occasion = Occasion.find(params[:id])
    end

end
