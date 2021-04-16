# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Animals dashboard", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:snakes) { FactoryBot.create(:animal_group, name: "snakes", user: user) }

  before do
    allow_any_instance_of(Dashboard::DashboardController)
      .to receive(:authenticate_user!)
    allow_any_instance_of(Dashboard::DashboardController).to receive(:current_user)
      .and_return(user)
  end

  describe "GET /dashboard/animals" do
    it "lists all animals" do
      FactoryBot.create(:animal, name: "Alicia", animal_group: snakes)
      FactoryBot.create(:animal, name: "Fredo", animal_group: snakes)
      get dashboard_animals_path
      expect(response.body).to include "Alicia"
      expect(response.body).to include "Fredo"
    end
  end

  describe "GET /dashboard/animals/new" do
    it "renders a new animal form" do
      get new_dashboard_animal_path
      assert_select "form[action='#{dashboard_animals_path}']" do
        assert_select "#animal_name[required]"
      end
    end
  end

  describe "POST /dashboard/animals" do
    context "with valid input" do
      before do
        post dashboard_animals_path,
          params: {
            animal: {
              name: "Jeff",
              sex: Animal::MALE,
              animal_group_id: snakes.id
            }
          }
      end

      it "creates a new animal" do
        animal = Animal.last
        expect(animal).to be
        expect(animal.name).to eq "Jeff"
        expect(animal.sex).to eq "m"
        expect(animal.animal_group).to eq snakes
      end

      it "redirects to the animals index page" do
        expect(response).to redirect_to dashboard_animals_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq "Saved."
      end
    end

    context "with invalid input" do
      before do
        post dashboard_animals_path,
          params: {
            animal: {
              name: "s"
            }
          }
      end

      it "renders the new form again" do
        assert_select "form[action='#{dashboard_animals_path}']"
      end

      it "renders errors" do
        assert_select "li", text: "Name is too short (minimum is 2 characters)"
      end
    end
  end

  describe "GET /dashboard/animals/:id/edit" do
    let(:animal) { FactoryBot.create(:animal) }

    before do
      get edit_dashboard_animal_path(animal)
    end

    it "renders the edit form" do
      assert_select "form[action='#{dashboard_animal_path(animal)}']"
    end
  end

  describe "PATCH /dashboard/animals/:id" do
    let(:animal) { FactoryBot.create(:animal, name: "Jeff") }

    context "with valid input" do
      before do
        patch dashboard_animal_path(animal),
          params: {
            animal: {
              name: "Alexis",
              description: "A snake"
            }
          }
      end

      it "updates the animal" do
        animal.reload
        expect(animal.name).to eq "Alexis"
        expect(animal.description).to eq "A snake"
      end

      it "redirects to the edit page" do
        expect(response).to redirect_to dashboard_animals_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq "Updated."
      end
    end

    context "with invalid input" do
      before do
        patch dashboard_animal_path(animal),
          params: {
            animal: {
              name: "d"
            }
          }
      end

      it "renders the edit form again" do
        assert_select "form[action='#{dashboard_animal_path(animal)}']"
      end

      it "renders errors" do
        assert_select "li", text: "Name is too short (minimum is 2 characters)"
      end
    end
  end

  describe "DELETE /dashboard/animals/:id" do
    let(:animal) { FactoryBot.create(:animal) }

    def perform
      delete dashboard_animal_path(animal)
    end

    it "deletes the animal" do
      perform
      expect(Animal.exists?(animal.id)).to be_falsey
    end

    it "redirects to the animals index" do
      perform
      expect(response).to redirect_to(dashboard_animals_path)
    end

    it "sets a flash notice" do
      perform
      expect(flash[:notice]).to eq "Deleted."
    end
  end
end
