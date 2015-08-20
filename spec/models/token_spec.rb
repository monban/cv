require 'rails_helper'

RSpec.describe Token, type: :model do
  let(:token) { FactoryGirl.build(:token) }
  it "won't allow tokens with duplicate keys to be created" do
    token.save!
    expect(FactoryGirl.build(:token)).to_not be_valid
  end
  describe '#expired?' do
    context 'when expired' do
      let(:time) { token.expires_at + 1.day }
      it 'returns true' do
        allow(Time).to receive(:now).and_return(time)
        expect(token.expired?).to be_truthy
      end
    end
    context 'when not expired' do
      let(:time) { token.expires_at - 1.day }
      it 'returns false' do
        allow(Time).to receive(:now).and_return(time)
        expect(token.expired?).to be_falsey
      end
    end
  end
end
