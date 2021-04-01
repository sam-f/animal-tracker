# frozen_string_literal: true

require "rails_helper"

RSpec.describe Animal, type: :model do
  describe "associations" do
    it { should belong_to(:animal_group) }
    it { should have_many(:weight_records).dependent(:delete_all) }
    it { should have_many(:feeding_records).dependent(:delete_all) }
    it { should have_many(:cleaning_records).dependent(:delete_all) }
    it { should have_many(:stock_list_placements).dependent(:destroy_async) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :sex }
    it { should validate_inclusion_of(:sex).in_array(Animal::SEXES) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(140) }
  end

  describe "associations" do
    it { should have_many_attached(:photos) }
  end
end
