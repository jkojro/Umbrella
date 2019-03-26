FactoryBot.define do
  factory :friend, class: 'Friend' do
    email { 'myfriend@example.com' }
    answear { nil }
    association :umbrella
  end
end
