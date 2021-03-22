# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable, :recoverable, :rememberable, :validatable

  # Associations
  has_many :animals, dependent: :destroy_async

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_insensitive: true}
end
