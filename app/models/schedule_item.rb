# frozen_string_literal: true

class ScheduleItem < ApplicationRecord
  acts_as_list scope: :schedule

  # Associations
  belongs_to :schedule

  # Validations
  validates :name, presence: true, length: {minimum: 2, maximum: 140}
end
