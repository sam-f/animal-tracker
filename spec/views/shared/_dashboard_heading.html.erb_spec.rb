# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shared/_dashboard_heading.html.erb", type: :view do
  def render_partial
    render partial: "shared/dashboard_heading"
  end

  def stub_content_for(to_return = false)
    allow(view).to receive(:content_for?).with(:heading).and_return !!to_return
    allow(view).to receive(:content_for).with(:heading).and_return to_return
  end

  it "renders a heading" do
    stub_content_for "Animals"
    render_partial
    expect(rendered).to have_css "h1", text: "Animals"
  end

  context "no heading given" do
    it "renders nothing" do
      stub_content_for
      render_partial
      expect(rendered).to eq ""
    end
  end
end
