FactoryBot.define do
  factory :stock_list_placement do
    association :animal
    association :stock_list
    name { "CB20 Royal" }
  end
end
