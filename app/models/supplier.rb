# frozen_string_literal: true

class Supplier < ApplicationRecord
  # Validations
  validates :name, presence: true
end
