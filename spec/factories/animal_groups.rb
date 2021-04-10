FactoryBot.define do
  factory :animal_group do
    name { "Snakes" }
    association :user
  end
end
