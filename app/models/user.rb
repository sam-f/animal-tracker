# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable, :recoverable, :rememberable, :validatable

  # Associations
  has_many :animal_groups, dependent: :destroy_async
  has_many :stock_lists, dependent: :destroy_async

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_insensitive: true}
end