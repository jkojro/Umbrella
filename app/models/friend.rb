class Friend < ApplicationRecord
  belongs_to :umbrella

  validates :email, presence: true
end
