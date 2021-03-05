class Card < ApplicationRecord
    belongs_to :occasion
    belongs_to :aisle
    validates_presence_of :occasion_id
    validates_presence_of :aisle_id
    validates :in_stock, numericality: { only_integer: true }
    validates_presence_of :description
    validates :description, length: { maximum: 150 }
    has_one_attached :avatar

    def self.search(search)
        if search
            sku = Card.find_by(:sku => search) 
            if sku
                self.where(:sku => search)
            else
                Card.all
            end
        else
            Card.all
        end 
    end

    def better_flash 
       message= pluralize(@card.count, 'item')
    end 
end
