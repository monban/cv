require 'rails_helper'
require 'controllers/support/admin_only'

RSpec.describe ReferencesController, type: :controller do
  it_behaves_like 'an admin controller', verify_partial_doubles: false
  context 'admin logged in' do
    before(:example) { expect(subject).to receive(:admin?).and_return(true) }
    let!(:reference) { FactoryGirl.create(:reference) }
    describe '#delete' do
      it { expect { delete(:destroy, id: reference.id) }.to change(Reference, :count).by(-1) }
    end
  end
end
