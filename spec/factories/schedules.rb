FactoryBot.define do
  factory :schedule do
    name { "Feeding Schedule" }
    repeat { Schedule::WEEKLY }
    start_on { Date.today }
  end
end
