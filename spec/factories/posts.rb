FactoryBot.define do
  factory :post do
    title { 'Amazing post' }
    content { 'The content of this post is amazing' }
    association :admin
  end
end
