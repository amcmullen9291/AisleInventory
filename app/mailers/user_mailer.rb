class UserMailer < ActionMailer::Base
    default :from => "Status@AisleInventory.com"

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.store_id} <#{user.email}>", :subject => "Aisle Invertory Registration Confirmation")
    end

    def activity_report(user, content)
        @user = user 
        mail(to: @user.email,
        content_type: "text/html", 
        body: content,
        subject: "store #{@user.store_id} Inventory Report")
    end

end