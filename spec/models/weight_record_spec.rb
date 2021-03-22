# frozen_string_literal: true

require "rails_helper"

RSpec.describe WeightRecord, type: :model do
  describe "associations" do
    it { should belong_to :animal }
  end

  describe "validations" do
    it { should validate_presence_of :recorded_on }
    it { should validate_presence_of :weight }
  end
end
