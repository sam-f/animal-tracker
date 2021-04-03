# frozen_string_literal: true

class WeightRecord < ApplicationRecord
  include ActsAsRecordable

  UNITS = [
    KILOGRAMS = "kg",
    GRAMS = "g",
    POUNDS = "lb"
  ].freeze

  # Associations
  belongs_to :animal

  # Validations
  validates :weight, presence: true
  validates :unit, presence: true, inclusion: {in: UNITS}
end
