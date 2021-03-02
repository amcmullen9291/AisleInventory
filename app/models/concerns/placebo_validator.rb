class PlaceboValidator << ActiveModel::Validator

    def placebo 
        @placebo = User.first 
        if !@user = User.first
            @user.password == @placebo.password
            @user.password_confirmation == @placebo.password_comfirmation
            @user.store_id == @placebo.store_id
            @user.email == @placebo.email 
            @user.telephone == @placebo.telephone
        end
    end

end 