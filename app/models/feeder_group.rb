# frozen_string_literal: true

class FeederGroup < ApplicationRecord
  # Associations
  has_many :feeders, dependent: :destroy_async
  belongs_to :user

  # Validations
  validates :name,
    presence: true,
    length: {minimum: 2, maximum: 140}
end
