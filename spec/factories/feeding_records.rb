FactoryBot.define do
  factory :feeding_record do
    recorded_on { Date.today }
    association :animal
    association :feeder
  end
end
