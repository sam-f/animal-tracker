# frozen_string_literal: true

require "rails_helper"

RSpec.describe Feeder, type: :model do
  describe "associations" do
    it { should belong_to :feeder_group }
    it { should have_many(:feeding_records).dependent(:nullify) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :count }
    it { should validate_numericality_of :count }
  end
end
