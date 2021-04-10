# frozen_string_literal: true

class AnimalGroup < ApplicationRecord
  VALIDATION_CONSTANTS = {
    name: {max_length: 140, min_length: 2}
  }.freeze

  # Associations
  belongs_to :user
  has_many :animals, dependent: :destroy_async

  # Validations
  validates :name,
    presence: true,
    length: {
      minimum: VALIDATION_CONSTANTS[:name][:min_length],
      maximum: VALIDATION_CONSTANTS[:name][:max_length]
    }
end
