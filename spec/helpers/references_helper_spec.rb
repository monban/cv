require 'rails_helper'

RSpec.describe ReferencesHelper, type: :helper, verify_partial_doubles: false do
  let(:reference) { FactoryGirl.create(:reference) }

  describe '#edit_reference_link' do
    context 'non admin' do
      before(:example) { allow(helper).to receive(:admin?).and_return(false) }
      it { expect(helper.edit_reference_link(reference)).to be_blank } 
    end

    context 'admin' do
      before(:example) { allow(helper).to receive(:admin?).and_return(true) }
      it { expect(helper.edit_reference_link(reference)).to include(edit_reference_path(reference)) } 
    end
  end
end
