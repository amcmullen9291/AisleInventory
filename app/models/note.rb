class Note < ApplicationRecord
    validates_presence_of :employeeInit, :notice => "are required"
    validates_presence_of :content

   
end
