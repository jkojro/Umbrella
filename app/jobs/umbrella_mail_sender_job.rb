class UmbrellaMailSenderJob <ApplicationJob
  def perform(friend_id)
    friend = Friend.find(friend_id)
    UmbrellaMailer.send_email_to_friend(friend).deliver_now
  end
end
