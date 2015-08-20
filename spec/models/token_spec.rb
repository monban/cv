require 'rails_helper'

RSpec.describe Token, type: :model do
  it "won't allow tokens with duplicate keys to be created" do
    token = FactoryGirl.create(:token)
    expect(FactoryGirl.build(:token)).to_not be_valid
  end
end
