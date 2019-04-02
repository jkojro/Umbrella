class Umbrella < ApplicationRecord
  belongs_to :user
  has_many :friends, inverse_of: :umbrella, dependent: :destroy
  accepts_nested_attributes_for :friends,
                                reject_if: proc { |att| att['email'].blank? },
                                allow_destroy: true

  validates :message, presence: true

  after_save :send_emails_to_friends, :queue_result_mailer_job
  after_update_commit :send_thanks_message

  DAYS_TO_WAIT = 7

  def days_to_end
    time_passed = Time.now.to_date - created_at.to_date
    DAYS_TO_WAIT - time_passed.to_i
  end

  def send_result_if_completed
    UmbrellaResultMailSenderJob.perform_now(self.id) if completed?
  end

  private

  def send_emails_to_friends
    self.friend_ids.each do |friend_id|
      UmbrellaMailToFriendSenderJob.perform_now(friend_id)
    end
  end

  def queue_result_mailer_job
    UmbrellaResultMailSenderJob.set(wait: 7.days).perform_later(self.id)
  end

  def completed?
    self.friends.all? { |f| f.answear.present? }
  end

  def send_thanks_message
    self.friend_ids.each do |friend_id|
      UmbrellaThanksMailSenderJob.perform_now(friend_id)
    end
  end
end
