require 'rails_helper'

RSpec.describe "resume/index", type: :view do
  before :each do
    # Disable double partial verification before each test to prevent "does not implement" errors
    # https://github.com/rspec/rspec-rails/issues/1076
    RSpec::Mocks.configuration.verify_partial_doubles = false
    assign(:sections, FactoryGirl.create_list(:section, 3))
    assign(:references, FactoryGirl.create_list(:reference, 3))
    #allow(view).to receive(:current_token).and_return(token)
    controller.stub(:current_token) { FactoryGirl.build(:token) }
  end
  after(:each) do
    RSpec::Mocks.configuration.verify_partial_doubles = true
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
