class PlaceboValidator < ActiveModel::Validator

    def validate(record)
        if !@user = User.first
            @placebo = User.first
            validates :password, inclusion: { in: "#{@placebo.password}" }
            validates :store_id, inclusion: { in: "#{@placebo.store_id}" }
            validates :email, inclusion: { in: "#{@placebo.email}" }
            validates :telephone, inclusion: { in: "#{@placebo.telephone}" }
            validates :password_confirmation, inclusion: { in: "#{@placebo.password_confirmation}" } 
            validates_presence_of :employeeInit, :message => "required"
            validates_uniqueness_of :employeeInit, :message => "already enrolled"
            unless record.valid?
                record.errors.add :name, "Enter Store_ID and Access_ID"
            end
        else
            validates_presence_of :store_id, :message => "not entered"
            validates :password, confirmation: true
            validates_presence_of :password_confirmation
            validates_presence_of :email
            validates_presence_of :telephone
            validates_uniqueness_of :employeeinit
        end
    end

end 
