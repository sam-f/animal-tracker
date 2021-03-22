FactoryBot.define do
  factory :animal do
    association :weight_record
    name { "Alice" }
  end
end
