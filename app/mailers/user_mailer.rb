class UserMailer < ActionMailer::Base
    default :from => "Status@AisleInventory.com"

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.store_id} <#{user.email}>", :subject => "Aisle Invertory Registration Confirmation")
    end

    def activity_report(user, store, content, init)
        @user = user 
        mail(to: @user,
        content_type: "text/html", 
        body: content, 
        subject: "store #{store} Inventory Report < #{init} >")
    end

end