# frozen_string_literal: true

class StockListPlacement < ApplicationRecord
  # Associations
  belongs_to :stock_list
  belongs_to :animal
  has_many_attached :photos

  # Validations
  validates :name,
    presence: true,
    length: {minimum: 2, maximum: 140}
end
