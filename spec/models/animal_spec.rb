# frozen_string_literal: true

require "rails_helper"

RSpec.describe Animal, type: :model do
  describe "associations" do
    it { should have_many(:weight_records).dependent(:delete_all) }
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
