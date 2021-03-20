# frozen_string_literal: true

# Represents a user-owned animal.
# TODO:
#   Assocs:
#     User - the owner of the animal. Devise model.
#     AnimalFeeding - record of feeding.
#     AnimalWeight - record of weight.
#     FeedingSchedule - records a feeding schedule. Ie weekly.
#     AnimalShedding - record of shedding history.
#     AnimalPairing - record of pairing with another animal.
#     has_many_attached :photos - user submitted photos of animal.
class Animal < ApplicationRecord
  SEXES = [
    MALE = "m",
    FEMALE = "f",
    UNKNOWN = "u"
  ].freeze

  validates :name, presence: true
  validates :sex, presence: true, inclusion: {in: SEXES}
end
