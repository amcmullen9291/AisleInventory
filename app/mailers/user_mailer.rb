class UserMailer < ActionMailer::Base
    default :from => "Status@AisleInventory.com"

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.store_id} <#{user.email}>", :subject => "Aisle Invertory Registration Confirmation")
    end

    def activity_report(user)
        @user = user
        mail(:to => "#{user.store_id} <#{user.email}>", :subject => "Status Report")
    end

    def activity(user) 
        mail(:to => "#{user.store_id} <#{user.email}>", :subject => "Log-In")
    end
end