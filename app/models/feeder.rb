# frozen_string_literal: true

class Feeder < ApplicationRecord
  # Associations
  belongs_to :feeder_group
  has_many :feeding_records, dependent: :nullify

  # Validations
  validates :name, presence: true
  validates :count, presence: true, numericality: true
end
