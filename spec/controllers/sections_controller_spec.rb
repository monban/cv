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
      context 'with a secton defined' do
        let(:sections) { [FactoryGirl.create(:section)] }
        it 'assigns all sections to @sections' do
          get :index
          expect(assigns(:sections)).to eq(sections)
        end
      end
    end
  end
  describe '#edit' do
    let(:section) { FactoryGirl.create(:section) }
    it 'assigns the section to be edited to @section ' do
      get :edit, id: section.id
      expect(assigns(:section)).to eq(section)
    end
  end
  
  describe '#update' do
    let(:section) { FactoryGirl.create(:section) }
    it 'updates the object' do
      expect {put(:update, id: section.id, section: {title: section.title.reverse})}.
        to change{section.reload.title}.
        from(section.title).to(section.title.reverse)
    end
  end
end
