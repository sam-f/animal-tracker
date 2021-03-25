FactoryBot.define do
  factory :animal do
    association :user
    name { "Alice" }
  end
end
