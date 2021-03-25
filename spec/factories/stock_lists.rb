FactoryBot.define do
  factory :stock_list do
    association :user
    name { "First Clutch of '21" }
  end
end
