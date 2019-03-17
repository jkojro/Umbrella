class Umbrella < ApplicationRecord
  has_many :friends

  validates :message, presence: true
end
