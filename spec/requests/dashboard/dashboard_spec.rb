# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Dashboard root", type: :request do
  describe "GET /" do
    context "when signed in" do
      let(:user) { FactoryBot.create(:user) }

      before { sign_in(user) }

      it "responds http ok" do
        get dashboard_root_path
        expect(response.status).to eq 200
      end
    end

    context "not signed in" do
      it "redirects to sign in" do
        get dashboard_root_path
        expect(response.status).to eq 302
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
