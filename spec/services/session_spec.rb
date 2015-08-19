require 'rails_helper'

describe Session do
  let(:token) { FactoryGirl.create(:token) }

  context 'token in session' do
  let(:session) { {'token_id' => token.id } }
    it 'finds the current token' do
      expect(Session.new(session).current_token).
        to eq(token)
    end
    context 'with an empty key' do
      let(:key) { '' }
      it 'sets the current token to nil' do
        expect{Session.new(session).current_token = nil}.
          to change{session['token_id']}.from(token.id).
          to(nil)
      end
    end
  end

  context 'empty session' do
    let(:session) { Hash.new }

    it 'sets the current token in the session' do
      expect{ Session.new(session).current_token = token }
      .to change{session['token_id']}.from(nil).to(token.id)
    end
  end
end
