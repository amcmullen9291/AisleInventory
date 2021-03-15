class CardsController < ApplicationController
    before_action :set_card, only: [:show, :edit, :update, :destroy, :manufacturer ]
    after_action :update_notice, only: [:create, :update, :destroy ]
    def new 
        @card = Card.new
    end

    def create 
        @card = Card.new(card_params)
        @sku = Faker::Barcode.ean_with_composite_symbology(13)
        @card.sku = @sku
        if @card.save             
            redirect_to cards_path, notice: "Item #{@sku} Added"
        else
            render :new, notice: "Item not added. Try again"
        end 
    end 

    def edit 
    end 

    def update 
        if @card.update(card_params)
            redirect_to cards_path, notice: "Item #{@card.sku} Updated"
        else
            render :edit, notice: "record not updated"
        end
    end 

    def show
        @manufacturer = Manufacturere.find("#{@card.manufacturer_id}")
        
    end 

    def destroy
        @card.destroy
        redirect_to root_path
    end 

    def index 
        @cards = Card.search(params[:search])
        @card = Card.all
         flash.notice = "#{Card.sum(:in_stock)} items returned"
    end

    private 
    def card_params
        params.require(:card).permit(:description, :in_stock, :aisle_id, :card, :occasion_id, :sku, :manufacturer_id, :avatar, :search, :occasion_search)
    end

    def set_card 
        @card = Card.find(params[:id])
    end 

    def update_notice
    end
    
end
