FactoryBot.define do
  factory :feeding_record do
    food { "Large rat" }
    recorded_on { Date.today }
  end
end
