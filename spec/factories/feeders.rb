FactoryBot.define do
  factory :feeder do
    association :feeder_group
    name { "Large rat" }
  end
end
