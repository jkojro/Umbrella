class Umbrella < ApplicationRecord
  belongs_to :user
  has_many :friends, inverse_of: :umbrella, dependent: :destroy
  accepts_nested_attributes_for :friends,
                                reject_if: proc { |att| att['email'].blank? },
                                allow_destroy: true

  validates :message, presence: true

  after_save :send_emails_to_friends

  private

  def send_emails_to_friends
    self.friend_ids.each do |friend_id|
      UmbrellaMailSenderJob.perform_now(friend_id)
    end
  end
end
