FactoryBot.define do
  factory :weight_record do
    weight { 10.5 }
    recorded_on { Date.today }
    association :animal
  end
end
