class PlaceboValidator < ActiveModel::Validator

    def validate(record)
        @placebo = User.first 
        if !@user = User.first
            validates :password, inclusion: { in: "#{@placebo.password}" }
            validates :store_id, inclusion: { in: "#{@placebo.store_id}" }
            validates :email, inclusion: { in: "#{@placebo.email}" }
            validates :telephone, inclusion: { in: "#{@placebo.telephone}" }
            validates :password_confirmation, inclusion: { in: "#{@placebo.password_confirmation}" } 
        end
    end

end 
