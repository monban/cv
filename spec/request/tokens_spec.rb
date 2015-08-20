require 'rails_helper'

describe 'token middleware', :type => :request do
  let(:token) { FactoryGirl.create(:token) }

  context 'with a valid key' do
    let(:key) { token.key  }

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

    context 'with a reference' do
      let!(:reference) { FactoryGirl.create(:reference) }

      it 'does not show contact information' do
        get '/'
        expect(response.body).to_not include(reference.telephone)
      end
    end
end

context 'when no key' do
    context 'with a reference' do
      let!(:reference) { FactoryGirl.create(:reference) }

      it 'does not show contact information' do
        get '/'
        expect(response.body).to_not include(reference.telephone)
      end
    end
  end
end
