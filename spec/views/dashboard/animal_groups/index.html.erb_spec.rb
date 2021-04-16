# frozen_string_literal: true

require "rails_helper"

RSpec.describe "dashboard/animal_groups/index.html.erb", type: :view do
  let(:animal_group) do
    FactoryBot.build_stubbed(:animal_group, name: "Invertibrates", description: "Not snakes")
  end

  context "no animal groups" do
    before { assign(:animal_groups, []) }

    it "renders a message" do
      render
      expect(rendered).to have_content "You haven't added any animal groups yet"
      expect(rendered).to have_css "a[href='#{new_dashboard_animal_group_path}']", text: "Add some here!"
    end
  end

  it "renders animal groups" do
    assign(:animal_groups, [animal_group])
    render
    expect(rendered).to have_content "Invertibrates"
    expect(rendered).to have_content "Not snakes"
  end
end
