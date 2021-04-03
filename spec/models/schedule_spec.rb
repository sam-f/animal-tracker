# frozen_string_literal: true

require "rails_helper"

RSpec.describe Schedule, type: :model do
  describe "associations" do
    it { should belong_to :user }
    it { should have_many(:schedule_items).dependent(:delete_all) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(140) }
    it { should validate_presence_of(:repeat) }
    it { should validate_inclusion_of(:repeat).in_array(Schedule::REPEAT_OPTIONS) }
    it { should validate_presence_of(:start_on) }
  end
end
