class Aisle < ApplicationRecord
    serialize :occasions, Array
    has_many :cards 
    has_many :occasions, through: :cards
    has_many :manufacturers, through: :cards
    validates_presence_of :aisle_number
    validates_uniqueness_of :aisle_number, :message => "Already Entered"
    validates :aisle_number, numericality: true

    def manufacturer 
        #set_aisle
        card = Card.select(:occasion_id => @occasion.id)
        card = Card.find_by(:aisle_id => @aisle.id).pluck(:manufacturer.id)
        @manufacturer = Manufacture.find(manfacturere_id)
        @named = @manufacturere.name
    end 
end
