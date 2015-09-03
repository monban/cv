require 'rails_helper'

RSpec.describe "resume/index", type: :view do
  before :each do
    # Disable double partial verification before each test to prevent "does not implement" errors
    # https://github.com/rspec/rspec-rails/issues/1076
    RSpec::Mocks.configuration.verify_partial_doubles = false
    assign(:sections, FactoryGirl.create_list(:section, 3))
    assign(:references, FactoryGirl.create_list(:reference, 3))
    allow(view).to receive(:current_token).and_return(FactoryGirl.build(:token))
    allow(view).to receive(:admin?).and_return(true)
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
  context 'admin logged in' do
    before(:each) do
      allow(view).to receive(:current_token).and_return(FactoryGirl.build(:admin_token))
      end
     it 'renders the admin controls' do
       render
     expect(view).to render_template('_admin_controls')
   end
  end
end
