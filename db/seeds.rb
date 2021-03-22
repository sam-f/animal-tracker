# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Animal.delete_all
FeedingRecord.delete_all
WeightRecord.delete_all

jeff = Animal.create!(
  name: "Jeff",
  scientific_name: "Python Regius",
  common_name: "Royal Python",
  age: "5 Years",
  birthday: Date.new(2016, 1, 1),
  sex: Animal::MALE,
  description: "A royal called jeff. lovely."
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
