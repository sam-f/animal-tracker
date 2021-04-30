# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Dashboard users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    allow_any_instance_of(Dashboard::DashboardController)
      .to receive(:authenticate_user!)
    allow_any_instance_of(Dashboard::DashboardController).to receive(:current_user)
      .and_return(user)
  end

  describe "GET /dashboard/profile" do
    it "responds 200 ok" do
      get "/dashboard/profile"
      expect(response.status).to eq 200
    end
  end
end
