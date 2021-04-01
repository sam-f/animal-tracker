FactoryBot.define do
  factory :feeder_group do
    association :user
    name { "Rats" }
  end
end
