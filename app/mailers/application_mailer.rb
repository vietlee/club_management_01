class ApplicationMailer < ActionMailer::Base
  default from: ENV['FCLUB_EMAIL_USERNAME']
  layout "mailer"
end
