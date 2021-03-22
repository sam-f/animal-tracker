FactoryBot.define do
  factory :animal do
    association :weight_record
    association :feeding_record
    name { "Alice" }
  end
end
