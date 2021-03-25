# frozen_string_literal: true

class CleaningRecord < ApplicationRecord
  include ActsAsRecordable

  # Associations
  belongs_to :animal
end
