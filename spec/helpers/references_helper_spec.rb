require 'rails_helper'

RSpec.describe ReferencesHelper, type: :helper, verify_partial_doubles: false do
  around(:example) do |example|
    class MockClass
      include ReferencesHelper
      def admin?
        raise 'please override this'
      end
      def link_to(*foo)
      end
    end
    example.run
    Object.send(:remove_const, :MockClass)
  end

  subject {MockClass.new}
  let(:reference) { FactoryGirl.build(:reference) }

  context 'non admin' do
    before(:example) { expect(subject).to receive(:admin?).and_return(false) }
    it { expect(subject.edit_reference(reference)).to be_blank } 
  end

  context 'admin' do
    before(:example) { expect(subject).to receive(:admin?).and_return(true) }
    it do
      expect(subject).to receive(:edit_reference_path)
      subject.edit_reference(reference)
    end
  end
end
