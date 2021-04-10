# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Animal groups dashboard", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    allow_any_instance_of(Dashboard::DashboardController)
      .to receive(:authenticate_user!)
    allow_any_instance_of(Dashboard::DashboardController).to receive(:current_user)
      .and_return(user)
  end

  describe "GET /dashboard/animal_groups" do
    it "lists all animal groups" do
      FactoryBot.create(:animal_group, name: "Amphibians", user: user)
      FactoryBot.create(:animal_group, name: "Snakes", user: user)
      get dashboard_animal_groups_path
      expect(response.body).to include "Amphibians"
      expect(response.body).to include "Snakes"
    end
  end

  describe "GET /dashboard/animal_groups/new" do
    it "renders a new animal_group form" do
      get new_dashboard_animal_group_path
      assert_select "form[action='#{dashboard_animal_groups_path}']" do
        assert_select "#animal_group_name[required]"
      end
    end
  end

  describe "POST /dashboard/animal_groups" do
    context "with valid input" do
      before do
        post dashboard_animal_groups_path,
          params: {
            animal_group: {
              name: "Snakes",
              description: "Rehomed snakes"
            }
          }
      end

      it "creates a new animal group" do
        animal_group = AnimalGroup.last
        expect(animal_group).to be
        expect(animal_group.name).to eq "Snakes"
        expect(animal_group.description).to eq "Rehomed snakes"
        expect(animal_group.user).to eq user
      end

      it "redirects to the animal groups index page" do
        expect(response).to redirect_to dashboard_animal_groups_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq "Saved."
      end
    end

    context "with invalid input" do
      before do
        post dashboard_animal_groups_path,
          params: {
            animal_group: {
              name: "s"
            }
          }
      end

      it "renders the new form again" do
        assert_select "form[action='#{dashboard_animal_groups_path}']"
      end

      it "renders errors" do
        assert_select "li", text: "Name is too short (minimum is 2 characters)"
      end
    end
  end

  describe "GET /dashboard/animal_groups/:id/edit" do
    let(:animal_group) { FactoryBot.create(:animal_group) }

    before do
      get edit_dashboard_animal_group_path(animal_group)
    end

    it "renders the edit form" do
      assert_select "form[action='#{dashboard_animal_group_path(animal_group)}']"
    end
  end

  describe "PATCH /dashboard/animal_groups/:id" do
    let(:animal_group) { FactoryBot.create(:animal_group, name: "Snakes") }

    context "with valid input" do
      before do
        patch dashboard_animal_group_path(animal_group),
          params: {
            animal_group: {
              name: "Reptiles",
              description: "Group of reptiles"
            }
          }
      end

      it "updates the animal group" do
        animal_group.reload
        expect(animal_group.name).to eq "Reptiles"
        expect(animal_group.description).to eq "Group of reptiles"
      end

      it "redirects to the edit page" do
        expect(response).to redirect_to dashboard_animal_groups_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq "Updated."
      end
    end

    context "with invalid input" do
      before do
        patch dashboard_animal_group_path(animal_group),
          params: {
            animal_group: {
              name: "d"
            }
          }
      end

      it "renders the edit form again" do
        assert_select "form[action='#{dashboard_animal_group_path(animal_group)}']"
      end

      it "renders errors" do
        assert_select "li", text: "Name is too short (minimum is 2 characters)"
      end
    end
  end

  describe "DELETE /dashboard/animal_groups/:id" do
    let(:animal_group) { FactoryBot.create(:animal_group) }

    def perform
      delete dashboard_animal_group_path(animal_group)
    end

    it "deletes the animal group" do
      perform
      expect(AnimalGroup.exists?(animal_group.id)).to be_falsey
    end

    it "redirects to the animal_groups index" do
      perform
      expect(response).to redirect_to(dashboard_animal_groups_path)
    end

    it "sets a flash notice" do
      perform
      expect(flash[:notice]).to eq "Deleted."
    end

    context "with animals" do
      before { FactoryBot.create(:animal, animal_group: animal_group) }

      it "does not delete the animal group" do
        perform
        expect(AnimalGroup.exists?(animal_group.id)).to be_truthy
      end

      it "displays an error on the screen" do
        perform
        follow_redirect!
        expect(response.body).to include "This animal group contains animals, please delete those first before deleting this group."
      end
    end
  end
end
