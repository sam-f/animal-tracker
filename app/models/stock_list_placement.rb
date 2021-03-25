# frozen_string_literal: true

class StockListPlacement < ApplicationRecord
  # Associations
  belongs_to :stock_list
  belongs_to :animal

  # Validations
  validates :name, presence: true
end
