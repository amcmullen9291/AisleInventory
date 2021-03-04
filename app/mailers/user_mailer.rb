class UserMailer < ActionMailer::Base
    default :from => "Status@AisleInventory"

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.name} <#{user.email}>", :subject => "Aisle Invertory Registration Confirmation")
    end

    def activity_report
        mail(:to => "BreededShelter@protonmail.com", :subject => "Status Report")
    end

end