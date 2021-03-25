# frozen_string_literal: true

require "rails_helper"

RSpec.describe Animal, type: :model do
  describe "associations" do
    it { should belong_to(:animal_group) }
    it { should have_many(:weight_records).dependent(:destroy_async) }
    it { should have_many(:feeding_records).dependent(:destroy_async) }
    it { should have_many(:stock_list_placements).dependent(:delete_all) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :sex }
    it { should validate_inclusion_of(:sex).in_array(Animal::SEXES) }
  end

  describe "associations" do
    it { should have_many_attached(:photos) }
  end
end
