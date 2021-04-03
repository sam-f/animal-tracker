# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.delete_all
AnimalGroup.delete_all
Animal.delete_all
FeedingRecord.delete_all
WeightRecord.delete_all
CleaningRecord.delete_all
StockList.delete_all
StockListPlacement.delete_all
Supplier.delete_all
Schedule.delete_all
ScheduleItem.delete_all
Feeder.delete_all
FeederGroup.delete_all

alex = User.create!(
  first_name: "Alex",
  last_name: "Smith",
  email: "alex@example.com",
  password: "secret"
)

boss_hogs = Supplier.create!(
  name: "Boss Hogs",
  email: "boss@hogs.com",
  user: alex
)

snakes = AnimalGroup.create!(
  name: "Snakes",
  description: "Snakes in room 3",
  user: alex
)

lizards = AnimalGroup.create!(
  name: "Lizards",
  description: "Lizards in room 2",
  user: alex
)

inverts = AnimalGroup.create!(
  name: "Inverts",
  description: "Inverts in room 1",
  user: alex
)

mammals = AnimalGroup.create!(
  name: "Mammals",
  user: alex
)

Animal.create!(
  animal_group: snakes,
  name: "Jeff",
  scientific_name: "Python Regius",
  common_name: "Royal Python",
  age: "5 Years",
  birthday: Date.new(2016, 1, 1),
  sex: Animal::MALE,
  description: "A royal called jeff. lovely."
)

Animal.create!(
  animal_group: snakes,
  name: "Bonnie",
  scientific_name: "Toxicodryas Blandingii",
  common_name: "Blanding's Tree Snake",
  age: "1 year",
  sex: Animal::FEMALE,
  description: "1/2 of Bonnie and Clyde.",
  supplier: boss_hogs,
  date_aquired: Date.new(2020, 6, 1)
)

snake_stock_list = StockList.create!(
  user: alex,
  name: "First clutch '21",
  available_from: Date.today
)

jeff = Animal.create!(
  animal_group: snakes,
  name: "Jeff",
  scientific_name: "Python Regius",
  common_name: "Royal Python",
  age: "5 Years",
  birthday: Date.new(2016, 1, 1),
  sex: Animal::MALE,
  description: "A royal called jeff. lovely."
)

StockListPlacement.create!(
  animal: jeff,
  stock_list: snake_stock_list,
  name: "Jeff CB20 Pastel Pied",
  price: 120
)

rats = FeederGroup.create!(
  user: alex,
  name: "Rats"
)

large_rat = Feeder.create!(
  feeder_group: rats,
  name: "Large Rat",
  count: 15
)

FeedingRecord.create!(
  recorded_on: Date.today,
  notes: "Left in overnight",
  animal: jeff,
  feeder: large_rat
)

WeightRecord.create!(
  weight: 5,
  recorded_on: Date.today,
  notes: "Scales slightly off",
  unit: WeightRecord::KILOGRAMS,
  animal: jeff
)

CleaningRecord.create!(
  recorded_on: Date.today,
  animal: jeff
)
