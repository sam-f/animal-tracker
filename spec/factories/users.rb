FactoryBot.define do
  factory :user do
    first_name { "Alex" }
    last_name { "Smith" }
    sequence(:email) { |n| "alex#{n}@example.com" }
    password { "secret" }
  end
end
