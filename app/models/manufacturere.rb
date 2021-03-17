class Manufacturere < ApplicationRecord
    has_many :cards 
    has_many :aisles, through: :cards

end