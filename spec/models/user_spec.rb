# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:animal_groups).dependent(:destroy_async) }
    it { should have_many(:stock_lists).dependent(:destroy_async) }
  end

  describe "validations" do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
