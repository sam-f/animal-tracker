FactoryBot.define do
  factory :user do
    first_name { "Alex" }
    last_name { "Smith" }
    email { "alex@example.com" }
    association :animal
  end
end
