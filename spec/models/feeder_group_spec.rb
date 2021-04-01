# frozen_string_literal: true

require "rails_helper"

RSpec.describe FeederGroup, type: :model do
  describe "associations" do
    it { should belong_to :user }
    it { should have_many(:feeders).dependent(:destroy_async) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
