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

alex = User.create!(
  first_name: "Alex",
  last_name: "Smith",
  email: "alex@example.com",
  password: "secret"
)

snakes = AnimalGroup.create!(
  name: "Snakes",
  user: alex
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

FeedingRecord.create!(
  food: "Large rat",
  recorded_on: Date.today,
  notes: "Left in overnight",
  animal: jeff
)

WeightRecord.create!(
  weight: 10.5,
  recorded_on: Date.today,
  notes: "Scales slightly off",
  animal: jeff
)

CleaningRecord.create!(
  recorded_on: Date.today,
  animal: jeff
)
