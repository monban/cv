require 'rails_helper'

RSpec.describe ResumeController, type: :controller do
  context "with a few references and sections" do
    before :each do
      FactoryGirl.create_list(:section, 3)
      FactoryGirl.create_list(:reference, 3)
    end
    it "shows the page" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
