# frozen_string_literal: true

class Schedule < ApplicationRecord
  # Associations
  belongs_to :user, inverse_of: :schedules
  has_many :schedule_items, -> { order(position: :asc) }, dependent: :delete_all

  # Validations
  validates :name, presence: true, length: {minimum: 2, maximum: 140}
  validates :repeat, presence: true, inclusion: {in: Scheduling::Repeat.all}
  validates :start_on, presence: true
end
