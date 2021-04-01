# frozen_string_literal: true

require "rails_helper"

RSpec.describe Supplier, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:animals).dependent(:nullify) }
  end

  describe "validations" do
    subject { FactoryBot.build(:supplier) }

    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(140).is_at_least(2) }
    it { should validate_length_of(:email).is_at_most(254).is_at_least(3) }
    it { should allow_value("email@email.com").for(:email) }
    it { should allow_value(nil).for(:email) }
    it { should allow_value("").for(:email) }
    it { should allow_value("sam@example.weirdDomain").for(:email) }
    it { should_not allow_value("email@f").for(:email) }
  end
end
