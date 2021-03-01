class Manufacturere < ApplicationRecord
    has_many :cards 
    has_many :aisles, through: :cards
    validates_presence_of :name 
end
