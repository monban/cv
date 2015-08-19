require 'rails_helper'

describe Session do
  context 'user token' do
    let(:token) { FactoryGirl.create(:token) }

    context 'in session' do
      let(:session) { {'token_id' => token.id } }
      it 'finds the current token' do
        expect(Session.new(session).current_token).
          to eq(token)
      end
      it 'identifies non-admin' do
        expect(Session.new(session).admin?).to be_falsey
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
  context 'admin token' do
    let!(:token) { FactoryGirl.create(:admin_token) }
    let(:session) { {'token_id' => token.id } }

    context 'in session' do
      it 'identifies admin' do
        expect(Session.new(session).admin?).to be_truthy
      end
    end
  end
end
