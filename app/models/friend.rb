class Friend < ApplicationRecord
  belongs_to :umbrella

  validates :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: false

  after_update_commit :check_if_umbrella_completed
end

private

def check_if_umbrella_completed
  self.umbrella.send_result_if_completed
end
