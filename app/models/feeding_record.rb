# frozen_string_literal: true

class FeedingRecord < ApplicationRecord
  include ActsAsRecordable

  # Associations
  belongs_to :animal
  belongs_to :feeder, optional: true
end
