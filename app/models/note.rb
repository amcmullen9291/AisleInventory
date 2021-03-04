class Note < ApplicationRecord
    belongs_to :user

    validates_presence_of :employeeInit
    validates_presence_of :content
   
end
