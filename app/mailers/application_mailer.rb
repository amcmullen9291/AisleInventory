class ApplicationMailer < ActionMailer::Base
  default from: "#{User.first.email}"
  layout 'mailer'
end
