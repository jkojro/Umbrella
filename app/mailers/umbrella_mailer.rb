class UmbrellaMailer < ApplicationMailer
  def send_email_to_friend(friend)
    @friend = friend
    mail(to: @friend.email, subject: I18n.t('mails.to_friend_subject'))
  end

  def send_results(umbrella)
    @umbrella = umbrella
    mail(to: @umbrella.user.email, subject: I18n.t('mails.results_subject'))
  end

  def send_thanks(friend)
    @friend = friend
    mail(to: @friend.email, subject: I18n.t('mails.thanks_subject'))
  end
end
