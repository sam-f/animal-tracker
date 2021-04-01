# frozen_string_literal: true

class AnimalGroup < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :animals, dependent: :destroy_async

  # Validations
  validates :name,
    presence: true,
    length: {minimum: 2, maximum: 140}
end
