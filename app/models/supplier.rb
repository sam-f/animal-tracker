# frozen_string_literal: true

class Supplier < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :animals, dependent: :nullify

  # Validations
  validates :name, presence: true, length: {minimum: 2, maximum: 140}
  validates :email,
    format: {with: Email::Address::VALID_FORMAT},
    length: {minimum: 3, maximum: 254},
    allow_blank: true
end
