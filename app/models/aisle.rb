class Aisle < ApplicationRecord
    serialize :occasions, Array
    has_many :cards 
    has_many :occasions, through: :cards
    has_many :manufacturers, through: :cards
    validates_presence_of :aisle_number
    validates_uniqueness_of :aisle_number, :message => "Already Entered"
    validates :aisle_number, numericality: true


    def occasion
        self.occasions.pluck(:name_of)
    end
   
    def total
        self.occasions.pluck(:in_stock)
    end
end
