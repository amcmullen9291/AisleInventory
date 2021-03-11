class Interaction < ApplicationRecord
    
belongs_to :user
validates_presence_of :content, length: { minimum: 10 }
validates_presence_of :employeeInit
 
end
