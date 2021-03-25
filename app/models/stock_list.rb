# frozen_string_literal: true

class StockList < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :stock_list_placements

  # Validations
  # Maybe supply a default name on the form of
  # like "user.first_name user.last_name's stock list"
  validates :name, presence: true
end
