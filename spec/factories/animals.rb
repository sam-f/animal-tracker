FactoryBot.define do
  factory :animal do
    association :animal_group
    name { "Alice" }
  end
end
