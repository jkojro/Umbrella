class Friend < ApplicationRecord
  belongs_to :umbrella

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: false
end
