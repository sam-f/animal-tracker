# frozen_string_literal: true

class User < ApplicationRecord
  include AttributeExtractor

  devise :database_authenticatable,
    :registerable, :recoverable, :rememberable, :validatable

  # Associations
  has_many :animal_groups, dependent: :destroy_async, inverse_of: :user
  has_many :animals, through: :animal_groups
  has_many :stock_lists, dependent: :destroy_async
  has_many :stock_list_placements, through: :stock_lists
  has_many :suppliers, dependent: :destroy_async
  has_many :schedules, dependent: :destroy_async, inverse_of: :user
  has_many :schedule_items, through: :schedules
  has_one_attached :photo

  # Validations
  validates :first_name, presence: true, length: {minimum: 2, maximum: 80}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 80}
  validates :email,
    presence: true,
    uniqueness: {case_insensitive: true},
    format: {with: Email::Address::VALID_FORMAT},
    length: {minimum: 3, maximum: 254}

  def scientific_names = extract_attribute_from(:animals, :scientific_name)

  def common_names = extract_attribute_from(:animals, :common_name)

  def allows_notifications?
  end
end
