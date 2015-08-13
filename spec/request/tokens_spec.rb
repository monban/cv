require 'rails_helper'

describe 'token middleware', :type => :request do
  let(:token) { FactoryGirl.create(:token) }

  context 'with a valid key' do
    let(:key) { token.key  }

    it 'finds the correct token' do
      get '/', {token: key}
      expect(Token.current).to eq(token)
    end


    context 'with a reference' do
      let!(:reference) { FactoryGirl.create(:reference) }

      it 'shows contact information' do
        get '/', {token: key}
        expect(response.body).to include(reference.telephone)
      end
    end
  end

  context 'when incorrect key' do
    let(:key) { token.key + 'foo' }

    it 'returns nil' do
      get '/', {token: key + 'foo'}
      expect(Token.current).to be_nil
    end
    context 'with a reference' do
      let!(:reference) { FactoryGirl.create(:reference) }

      it 'does not show contact information' do
        get '/'
        expect(response.body).to_not include(reference.telephone)
      end
    end
end

context 'when no key' do
    it 'returns nil' do
      get '/'
      expect(Token.current).to be_nil
    end

    context 'with a reference' do
      let!(:reference) { FactoryGirl.create(:reference) }

      it 'does not show contact information' do
        get '/'
        expect(response.body).to_not include(reference.telephone)
      end
    end
  end
end
