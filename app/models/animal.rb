# frozen_string_literal: true

# Represents a user-owned animal.
# TODO:
#   Assocs:
#     AnimalGroup
#     User - the owner of the animal. Devise model.
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

  # Associations
  belongs_to :user
  has_many :weight_records, dependent: :destroy_async
  has_many :feeding_records, dependent: :destroy_async
  has_many :stock_list_placements, dependent: :delete_all
  has_many_attached :photos

  # Validations
  validates :name, presence: true
  validates :sex, presence: true, inclusion: {in: SEXES}
end
