require 'rails_helper'

describe ApplicationHelper do
  describe '#render_markdown' do
    let(:example_text) { 'some random string' }
    before(:example) { expect(Kramdown::Document).to receive(:new).with(example_text).and_call_original }
    it { render_markdown(example_text) }
  end
end

