# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:animal_groups).dependent(:destroy_async).inverse_of(:user) }
    it { should have_many(:animals).through(:animal_groups) }
    it { should have_many(:stock_lists).dependent(:destroy_async) }
    it { should have_many(:stock_list_placements).through(:stock_lists) }
    it { should have_many(:suppliers).dependent(:destroy_async) }
    it { should have_many(:schedules).dependent(:destroy_async) }
    it { should have_one_attached(:photo) }
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

  shared_examples_for "an extractor of animal attributes" do |attribute|
    describe "##{attribute}s" do
      let(:user) { FactoryBot.create(:user, animal_groups: [animal_group]) }
      let(:animal_group) { FactoryBot.create(:animal_group, animals: animals) }
      let(:animals) {
        [
          FactoryBot.create(:animal, "#{attribute}": "Boiga Dendrophila"),
          FactoryBot.create(:animal, "#{attribute}": "Grammastola Pulchra"),
          FactoryBot.create(:animal, "#{attribute}": "Grammastola Pulchra"),
          FactoryBot.create(:animal, "#{attribute}": nil)
        ]
      }

      subject { user.send("#{attribute}s") }

      it { should eq ["Boiga Dendrophila", "Grammastola Pulchra"] }
      it { should be_frozen }
      # _Not_ an active record collection.
      it { should be_an Array }
    end
  end

  it_behaves_like "an extractor of animal attributes", :scientific_name
  it_behaves_like "an extractor of animal attributes", :common_name
end
