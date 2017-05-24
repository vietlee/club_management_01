require "rails_helper"

RSpec.describe "organizations/show", type: :view do
  it "displays the name organization" do
    assign(:organization, Organization.new(name: "Framgia"))
    render
    expect(rendered).to include("Framgia")
  end
end
