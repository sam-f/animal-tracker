# frozen_string_literal: true

# TODO:
#   Attrs:
#     Unit
class WeightRecord < ApplicationRecord
  include ActsAsRecordable

  # Associations
  belongs_to :animal

  # Validations
  validates :weight, presence: true
end
