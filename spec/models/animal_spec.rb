# frozen_string_literal: true

require "rails_helper"

RSpec.describe Animal, type: :model do
  describe "associations" do
    it { should belong_to(:animal_group).inverse_of(:animals) }
    it { should belong_to(:supplier).optional }
    it { should have_many(:weight_records).dependent(:delete_all) }
    it { should have_many(:feeding_records).dependent(:delete_all) }
    it { should have_many(:cleaning_records).dependent(:delete_all) }
    it { should have_many(:stock_list_placements).dependent(:destroy_async) }
    it { should have_one_attached(:photo) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :sex }
    it { should validate_inclusion_of(:sex).in_array(Animal::SEXES) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(140) }
  end

  describe "#optimised_photo" do
    let(:animal) { FactoryBot.build(:animal) }

    context "photo attached" do
      before do
        photo = File.open(Rails.root.join("test-files", "bruno.jpg"))
        animal.photo.attach(io: photo, filename: "bruno.jpg")
      end

      it "returns an active storage variant" do
        expect(animal.optimised_photo).to be_a ActiveStorage::VariantWithRecord
      end

      it "has transformations" do
        expect(animal.optimised_photo(format: :jpeg).variation.transformations).to eq({
          convert: :jpeg, format: "jpg", gravity: :center, resize_to_fill: [400, 300]
        })
      end

      it "defaults to webp" do
        expect(animal.optimised_photo.variation.transformations).to eq({
          convert: :webp, format: "jpg", gravity: :center, resize_to_fill: [400, 300]
        })
      end
    end

    context "photo not attached" do
      it "returns nil" do
        expect(animal.optimised_photo).to be_nil
      end
    end
  end
end
