require 'rails_helper'

RSpec.describe Token, type: :model do
  it "sets the current token" do
    token = FactoryGirl.create(:token)
    expect{Token.set_current(token.key)}.to change{Token.current}.from(nil).to(token)
  end
  it "won't allow tokens with duplicate keys to be created" do
    token = FactoryGirl.create(:token)
    expect(FactoryGirl.build(:token)).to_not be_valid
  end
end
