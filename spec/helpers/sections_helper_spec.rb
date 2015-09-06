require 'rails_helper'

RSpec.describe SectionsHelper, type: :helper, verify_partial_doubles: false do
  class MockClass
    include SectionsHelper
    def admin?
      raise 'please override this'
    end
    def link_to(*foo)
    end
  end

  subject {MockClass.new}
  let(:section) { FactoryGirl.build(:section) }

  context 'non admin' do
    before(:example) { expect(subject).to receive(:admin?).and_return(false) }
    it { expect(subject.edit_section(section)).to be_blank } 
  end

  context 'admin' do
    before(:example) { expect(subject).to receive(:admin?).and_return(true) }
    it do
      expect(subject).to receive(:edit_section_path)
      subject.edit_section(section)
    end
  end
end
