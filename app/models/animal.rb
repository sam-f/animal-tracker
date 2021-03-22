# frozen_string_literal: true

# Represents a user-owned animal.
# TODO:
#   Assocs:
#     User - the owner of the animal. Devise model.
#     FeedingRecord - record of feeding.
#     WeightRecord - record of weight.
#     FeedingSchedule - records a feeding schedule. Ie weekly.
#     SheddingRecord - record of shedding history.
#     PairingRecord - record of pairing with another animal.
class Animal < ApplicationRecord
  # Constants
  SEXES = [
    MALE = "m",
    FEMALE = "f",
    UNKNOWN = "u"
  ].freeze

  # Validations
  validates :name, presence: true
  validates :sex, presence: true, inclusion: {in: SEXES}

  # Associations
  has_many_attached :photos
end
