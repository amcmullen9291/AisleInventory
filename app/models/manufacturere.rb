class Manufacturere < ApplicationRecord
    has_many :cards 
    has_many :aisles, through: :cards

    def cards_list
        if Card.manufacturere_id = Self.id 
            @cards = Card.pluck(:aisle_id) 
        end
    end

end