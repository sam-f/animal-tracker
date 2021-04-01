# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:animal_groups).dependent(:destroy_async) }
    it { should have_many(:animals).through(:animal_groups) }
    it { should have_many(:stock_lists).dependent(:destroy_async) }
    it { should have_one_attached(:photo)}
  end

  describe "validations" do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_most(80).is_at_least(2) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_most(80).is_at_least(2) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(254).is_at_least(3) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value("email@email.com").for(:email) }
    it { should allow_value("sam@example.weirdDomain").for(:email) }
    it { should_not allow_value("email@f").for(:email) }
  end
end
