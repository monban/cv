require 'rails_helper'
require 'controllers/support/admin_only'

RSpec.describe SectionsController, type: :controller do
  it_behaves_like "an admin controller", verify_partial_doubles: false
  context 'admin logged in' do
    let(:sections) { [FactoryGirl.create(:section)] }
    before(:each) do
      allow(subject).to receive(:admin?).and_return(true) 
    end

    describe '#edit' do
      let(:section) { sections.first }
      before(:example) { get :edit, id: section.id }
      it { expect(assigns(:section)).to eq(section) }
    end
    describe '#update' do
      let(:section) { sections.first }
      def put_modified_section
        put(:update, id: section.id, section: {title: section.title.reverse})
      end

      it 'updates the object' do
        expect {put_modified_section}.
          to change{section.reload.title}.
          from(section.title).to(section.title.reverse)
      end
      describe 'redirects to resume' do
        before(:example) { put_modified_section }
        it { expect(response).to redirect_to(resume_path) }
      end
    end
  end
end
