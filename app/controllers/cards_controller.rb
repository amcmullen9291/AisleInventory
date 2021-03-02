class CardsController < ApplicationController
    before_action :set_card, only: [:show, :edit, :update, :destroy]
    after_action :update_notice, only: [:create, :update, :destroy ]
    def new 
        @card = Card.new
    end

    def create 
        @card = Card.new(card_params)
        if @card.save
            @sku = Faker::Barcode.ean_with_composite_symbology(13)
            @card.sku = @sku
            @card.save 
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
    end 

    def destroy
        @card.destroy
        redirect_to root_path
    end 

    def index 
        @cards = Card.all
    end 

    private 
    def card_params
        params.require(:card).permit(:description, :in_stock, :aisle_id, :card, :occasion_id, :sku, :manufacturer_id, :avatar)
    end

    def set_card 
        @card = Card.find(params[:id])
    end 

    def update_notice
        $status << "#{@card.sku} updated"
    end 
end
