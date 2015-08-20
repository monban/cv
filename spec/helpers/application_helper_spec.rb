require 'rails_helper'

describe ApplicationHelper do
  context 'when token set in session' do
    let(:token) { FactoryGirl.create(:token) }
    before(:each) do
      session['token_id'] = token.id
    end

    describe '#current_token' do
      it 'returns the current token' do
        expect(current_token).to eq(token)
      end
    end
  end

  context 'when no token set' do
    describe '#current_token' do
      it 'returns nil' do
        expect(current_token).to be_nil
      end
    end
  end
end

