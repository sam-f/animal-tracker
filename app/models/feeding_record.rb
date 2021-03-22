# frozen_string_literal: true

class FeedingRecord < ApplicationRecord
  # Associations
  belongs_to :animal

  # Validations
  validates :recorded_on, presence: true
  validates :food, presence: true
end
