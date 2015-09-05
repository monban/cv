require 'rails_helper'

RSpec.describe Tokens do
  class MockClass
    attr_accessor :session
    def self.helper_method(*foo)
    end
    include Tokens
  end
  subject { MockClass.new }

  describe '#admin?' do
    context 'with no token' do
      before(:each) { subject.session = {} }
      it { expect(subject.send(:admin?)).to be_falsey }
    end
    context 'with non-admin token' do
      before(:each) { subject.session = {'token_id' => FactoryGirl.create(:token).id} }
      it { expect(subject.send(:admin?)).to be_falsey }
    end
    context 'with admin token' do
      before(:each) { subject.session = {'token_id' => FactoryGirl.create(:admin_token).id} }
      it { expect(subject.send(:admin?)).to be_truthy }
    end
  end
  describe '#current_token' do
    context 'with no token' do
      before(:each) { subject.session = {} }
      it { expect(subject.send(:current_token)).to be_nil }  
    end
    context 'with some token' do
      let(:some_token) { FactoryGirl.create(:admin_token) }
      before(:each) { subject.session = {'token_id' => some_token.id} }
      it { expect(subject.send(:current_token)).to eq(some_token) }
    end
  end
end
