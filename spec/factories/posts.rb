FactoryBot.define do
  factory :post do
    title { 'Amazing post' }
    content { 'The content of this post is amazing' }
    association :administrator

    trait :invalid do
      title { nil }
    end

    trait :with_two_comments do
      after :create do |post|
        create_list :comment, 2, post: post
      end
    end
  end
end
