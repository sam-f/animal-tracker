# frozen_string_literal: true

class Supplier < ApplicationRecord
  # Validations
  validates :name, presence: true, length: {minimum: 2, maximum: 140}
  validates :email,
    format: {with: Email::Address::VALID_FORMAT},
    length: {minimum: 3, maximum: 254},
    allow_blank: true
end
