require 'rails_helper'

RSpec.describe "mining_types/show", type: :view do
  before(:each) do
    @mining_type = assign(:mining_type, MiningType.create!(
      name: "Name",
      acronym: "Acronym"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Acronym/)
  end
end
