# frozen_string_literal: true

require "rails_helper"
require_relative "concerns/acts_as_recordable"

RSpec.describe CleaningRecord, type: :model do
  it_behaves_like "a recorder of activities"

  describe "associations" do
    it { should belong_to :animal }
  end
end
