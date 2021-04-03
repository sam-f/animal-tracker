# frozen_string_literal: true

class Schedule < ApplicationRecord
  # Constants
  REPEAT_OPTIONS = [
    NEVER = "never",
    DAILY = "daily",
    WEEKLY = "weekly",
    MONTHLY = "monthly",
    YEARLY = "yearly"
  ].freeze

  # Associations
  belongs_to :user
  has_many :schedule_items, -> { order(position: :asc) }, dependent: :delete_all

  # Validations
  validates :name, presence: true, length: {minimum: 2, maximum: 140}
  validates :repeat, presence: true, inclusion: {in: REPEAT_OPTIONS}
  validates :start_on, presence: true
end
