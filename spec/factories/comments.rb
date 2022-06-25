FactoryBot.define do
  factory :comment do
    text { 'This is a comment' }
    email { 'user@user.com' }
    association :post
  end
end
