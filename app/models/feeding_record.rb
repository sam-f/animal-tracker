# frozen_string_literal: true

class FeedingRecord < ApplicationRecord
  include ActsAsRecordable

  # Associations
  belongs_to :animal

  # Validations
  validates :food, presence: true
end
