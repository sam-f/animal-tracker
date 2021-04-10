# frozen_string_literal: true

require "rails_helper"

RSpec.describe "dashboard/animals/index.html.erb", type: :view do
  let(:animal) do
    FactoryBot.build_stubbed(
      :animal,
      name: "Dionysus",
      common_name: "Mangrove Snake",
      scientific_name: "Boiga Dendrophila Dendrophila"
    )
  end

  it "renders animals" do
    assign(:animals, [animal])
    render
    expect(rendered).to have_content "Dionysus"
    expect(rendered).to have_content "Mangrove Snake"
    expect(rendered).to have_content "Boiga Dendrophila Dendrophila"
  end

  context "no animals" do
    before { assign(:animals, []) }

    it "renders a message" do
      render
      expect(rendered).to have_content "You haven't added any animals yet"
      expect(rendered).to have_css "a[href='#{new_dashboard_animal_path}']", text: "Add some here!"
    end
  end

  context "with animal group" do
    let(:animal_group) { FactoryBot.build_stubbed(:animal_group, name: "Snakes") }

    before do
      assign(:animals, [animal])
      assign(:animal_group, animal_group)
    end

    it "adds the animal group name to the heading" do
      expect(view).to receive(:content_for).with(:heading, "Animals in Snakes")
      render
    end
  end

  context "without animal group" do
    before { assign(:animals, [animal]) }

    it "renders the default heading" do
      expect(view).to receive(:content_for).with(:heading, "Animals")
      render
    end
  end
end
