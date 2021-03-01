class Occasion < ApplicationRecord
    has_many :cards
    has_many :aisles, through: :cards 
    validates_presence_of :name_of
end
