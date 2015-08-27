require 'rails_helper'

RSpec.describe SectionsController, type: :controller do
  describe '#index' do
    context 'admin logged in' do
      before(:each) do
        RSpec::Mocks.configuration.verify_partial_doubles = false
       allow(controller).to receive(:admin?).and_return(true) 
      end
      after(:each) do
        RSpec::Mocks.configuration.verify_partial_doubles = true
      end
      it 'shows the page' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

end
