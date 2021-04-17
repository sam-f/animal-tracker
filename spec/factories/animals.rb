FactoryBot.define do
  factory :animal do
    association :animal_group
    name { "Alice" }
    source { Animal::CB }
    sex { Animal::UNKNOWN_SEX }
  end
end
