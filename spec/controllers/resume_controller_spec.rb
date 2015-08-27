require 'rails_helper'

RSpec.describe ResumeController, type: :controller do
  context "with a few references and sections" do
    it "shows the page" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
