require 'rails_helper'

RSpec.describe SectionsHelper, type: :helper do
  let(:section) { FactoryGirl.build(:section) }

  describe '#edit_section' do
    before(:example) { section.save! }

    context 'non admin', verify_partial_doubles: false do
      before(:example) { allow(helper).to receive(:admin?).and_return(false) }
      it { expect(helper.edit_section(section)).to be_blank } 
    end

    context 'admin', verify_partial_doubles: false do
      before(:example) { allow(helper).to receive(:admin?).and_return(true) }
      it { expect(helper.edit_section(section)).to include(edit_section_path(section)) }
    end
  end

  describe '#render_section_content' do
    before(:example) { expect(helper).to receive(:render_markdown).with(section.content).and_call_original }
    it { helper.render_section_content(section) }
  end
end
