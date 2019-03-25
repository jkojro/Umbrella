FactoryBot.define do
  sequence(:email) { |n| "user#{n}@pink-umbrella.com" }

  factory :user, class: User do
    email
    password 'password'
  end
end
