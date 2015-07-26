require 'rails_helper'

RSpec.describe "resume/index", type: :view do
    before :each do
      assign(:sections, FactoryGirl.create_list(:section, 3))
      assign(:references, FactoryGirl.create_list(:reference, 3))
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
