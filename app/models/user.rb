class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :umbrellas

  validates :email, uniqueness: { case_sensitive: false }, presence: true
end
