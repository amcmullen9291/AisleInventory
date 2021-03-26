class Occasion < ApplicationRecord
    has_many :cards
    belongs_to :catagory
    has_many :aisles, through: :cards 
    validates_presence_of :name_of
    validates_uniqueness_of :name_of

    scope :order_by, -> (attribute) {order(attribute)}
end
