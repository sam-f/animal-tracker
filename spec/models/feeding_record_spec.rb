# frozen_string_literal: true

require "rails_helper"
require_relative "concerns/acts_as_recordable"

RSpec.describe FeedingRecord, type: :model do
  it_behaves_like "a recorder of activities"

  describe "associations" do
    it { should belong_to :animal }
  end

  describe "validations" do
    it { should validate_presence_of :food }
  end
end
