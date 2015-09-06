require 'rails_helper'

RSpec.describe "resume/index", type: :view, verify_partial_doubles: false do
  before :each do
    assign(:sections, FactoryGirl.create_list(:section, 3))
    assign(:references, FactoryGirl.create_list(:reference, 3))
    allow(view).to receive(:current_token).and_return(FactoryGirl.build(:token))
    allow(view).to receive(:admin?).and_return(true)
  end

  it "renders the sections" do
    render
    expect(view).to render_template('_section')
  end
  it "renders the references" do
    render
    expect(view).to render_template('_reference')
  end
end
