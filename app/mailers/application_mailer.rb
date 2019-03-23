class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAIL_PASSWORD"]
  layout 'mailer'
end
