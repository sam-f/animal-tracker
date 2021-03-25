# frozen_string_literal: true

require "rails_helper"

RSpec.describe AnimalGroup, type: :model do
  describe "associations" do
    it { should belong_to :user }
    it { should have_many(:animals).dependent(:destroy_async) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
