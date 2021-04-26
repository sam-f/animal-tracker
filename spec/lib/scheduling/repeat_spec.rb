# frozen_string_literal: true

require "rails_helper"

module Scheduling
  RSpec.describe Repeat do
    describe ".days_of_month" do
      subject { Repeat.days_of_month }

      it { should be_frozen }
      it { should be_an Array }
      it { should start_with "1" }
      it { should end_with "28" }
    end

    describe ".days_of_week" do
      subject { Repeat.days_of_week }

      it { should be_frozen }
      it { should be_an Array }
      it { should start_with "monday" }
      it { should end_with "sunday" }
    end

    describe ".misc" do
      subject { Repeat.misc }

      it { should be_frozen }
      it { should be_an Array }
    end

    describe ".all" do
      subject { Repeat.all }

      it { should be_frozen }
      it { should be_an Array }
      it { should start_with "1" }
      it { should end_with "never" }
    end
  end
end
