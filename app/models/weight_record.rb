# frozen_string_literal: true

class WeightRecord < ApplicationRecord
  # Associations
  belongs_to :animal

  # Validations
  validates :recorded_on, presence: true
  validates :weight, presence: true
end
