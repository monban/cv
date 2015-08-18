describe Session do
  let(:token) { FactoryGirl.create(:token) }

  context 'token in session' do
  let(:session) { {'token_id' => token.id } }
    it 'finds the current token' do
      expect(Session.new(session).current_token).
        to eq(token)
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
