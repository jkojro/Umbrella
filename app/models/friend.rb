class Friend < ApplicationRecord
  belongs_to :umbrella

  validates :email, :answear, presence: true
end
