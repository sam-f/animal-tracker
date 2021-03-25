# frozen_string_literal: true

require "rails_helper"

RSpec.describe StockListPlacement, type: :model do
  describe "associations" do
    it { should belong_to :animal }
    it { should belong_to :stock_list }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
