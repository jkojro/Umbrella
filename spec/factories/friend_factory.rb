FactoryBot.define do
  factory :friend, class: 'Friend' do
    email { 'myfriend@example.com' }
    answear { 'This is a factiruied friend answear' }
  end
end
