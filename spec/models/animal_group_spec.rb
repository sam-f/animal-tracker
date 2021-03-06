# frozen_string_literal: true

require "rails_helper"

RSpec.describe AnimalGroup, type: :model do
  describe "associations" do
    it { should belong_to(:user).inverse_of(:animal_groups) }
    it { should have_many(:animals).dependent(:restrict_with_exception).inverse_of(:animal_group) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(140) }
  end
end
