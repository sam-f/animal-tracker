# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Dashboard API users", type: :request do
  let(:user) { FactoryBot.create(:user, push_notifications: true) }

  before do
    allow_any_instance_of(Dashboard::DashboardController)
      .to receive(:authenticate_user!)
    allow_any_instance_of(Dashboard::DashboardController).to receive(:current_user)
      .and_return(user)
  end

  describe "GET /dashboard/api/users/profile" do
    it "responds 200 ok" do
      get "/dashboard/api/users/profile"
      expect(response.status).to eq 200
    end

    it "renders json" do
      get "/dashboard/api/users/profile"
      expect(JSON.parse(response.body)).to eq({
        "data" => {
          "attributes" => {
            "push_notifications" => true
          },
          "id" => user.id,
          "type" => "users"
        }
      })
    end
  end
end
