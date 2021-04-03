# frozen_string_literal: true

require "rails_helper"
require_relative "concerns/acts_as_recordable"

RSpec.describe WeightRecord, type: :model do
  it_behaves_like "a recorder of activities"

  describe "associations" do
    it { should belong_to :animal }
  end

  describe "validations" do
    it { should validate_presence_of :weight }
    it { should validate_presence_of :unit }
    it { should validate_inclusion_of(:unit).in_array(WeightRecord::UNITS) }
  end
end
