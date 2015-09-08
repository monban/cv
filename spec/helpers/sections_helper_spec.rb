require 'rails_helper'

RSpec.describe SectionsHelper, type: :helper, verify_partial_doubles: false  do
  let(:section) { FactoryGirl.build(:section) }
  context "with MockClass" do
    around(:example) do |example|
      class MockClass
        include SectionsHelper
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

  let(:example_text) { 'it doesn\'t matter' }
  describe '#render_section_content' do
    before(:example) { expect(helper).to receive(:render_markdown).with(section.content).and_call_original }
    it { helper.render_section_content(section) }
  end
end
