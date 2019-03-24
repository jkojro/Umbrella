class UmbrellaMailer < ApplicationMailer
  def send_email_to_friend(friend)
    @friend = friend
    mail(to: @friend.email, subject: I18n.t('.subject'))
  end
end
