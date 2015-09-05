require 'rails_helper'
require 'controllers/support/admin_only'

RSpec.describe SectionsController, type: :controller do
  it_behaves_like "an admin controller"
  context 'admin logged in' do
    let(:sections) { [FactoryGirl.create(:section)] }
    before(:each) do
      allow(subject).to receive(:admin?).and_return(true) 
    end

    describe '#index' do
      before { get :index }
      it { expect(assigns(:sections)).to eq(sections) }
    end
    describe '#edit' do
      let(:section) { sections.first }
      before(:example) { get :edit, id: section.id }
      it { expect(assigns(:section)).to eq(section) }
    end
    describe '#update' do
      let(:section) { sections.first }
      it 'updates the object' do
        expect {put(:update, id: section.id, section: {title: section.title.reverse})}.
          to change{section.reload.title}.
          from(section.title).to(section.title.reverse)
      end
    end
  end
end
