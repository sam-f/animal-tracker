# frozen_string_literal: true

# Represents a user-owned animal.
# TODO:
#   Assocs:
#     FeedingSchedule - records a feeding schedule. Ie weekly.
#     SheddingRecord - record of shedding history.
#     PairingRecord - record of pairing with another animal.
#   Attrs:
#     Sort out birthday etc and use DOB
class Animal < ApplicationRecord
  VALIDATION_CONSTANTS = {
    name: {max_length: 140, min_length: 2}
  }.freeze

  # Constants
  SEXES = [
    MALE = "m",
    FEMALE = "f",
    UNKNOWN = "u"
  ].freeze

  # Associations
  belongs_to :animal_group, inverse_of: :animals
  belongs_to :supplier, optional: true
  has_many :weight_records, dependent: :delete_all
  has_many :feeding_records, dependent: :delete_all
  has_many :cleaning_records, dependent: :delete_all
  has_many :stock_list_placements, dependent: :destroy_async
  has_one_attached :photo

  # Validations
  validates :name,
    presence: true,
    length: {
      minimum: VALIDATION_CONSTANTS[:name][:min_length],
      maximum: VALIDATION_CONSTANTS[:name][:max_length]
    }
  validates :sex, presence: true, inclusion: {in: SEXES}

  def optimised_photo(format: :webp)
    if photo.attached?
      photo.variant(resize_to_fill: [400, 300].freeze, convert: format, gravity: :center)
    end
  end
end
