# frozen_string_literal: true

class Feeder < ApplicationRecord
  # Associations
  belongs_to :feeder_group
  has_many :feeding_records, dependent: :nullify

  # Validations
  validates :name,
    presence: true,
    length: {minimum: 2, maximum: 140}
  validates :count,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
