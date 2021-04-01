# frozen_string_literal: true

require "rails_helper"

RSpec.describe Feeder, type: :model do
  describe "associations" do
    it { should belong_to :feeder_group }
    it { should have_many(:feeding_records).dependent(:nullify) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(140) }
    it { should validate_presence_of :count }
    it { should validate_numericality_of(:count).only_integer.is_greater_than_or_equal_to(0) }
  end
end
