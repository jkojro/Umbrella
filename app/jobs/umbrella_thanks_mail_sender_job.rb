class UmbrellaThanksMailSenderJob <ApplicationJob
  def perform(friend_id)
    friend = Friend.find(friend_id)
    UmbrellaMailer.send_thanks(friend).deliver_now
  end
end
