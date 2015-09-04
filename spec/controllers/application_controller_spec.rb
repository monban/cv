require 'rails_helper'

RSpec.describe(ApplicationController) do
  describe 'includes the Tokens concern' do
    it { expect(described_class.ancestors.include?(Tokens)).to be_truthy }
  end
end
