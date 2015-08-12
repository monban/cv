require 'rails_helper'

describe "token middleware", :type => :request do
  let(:token) { FactoryGirl.create(:token) }
  it "finds the correct token" do
    get '/', {token: token.key}
    expect(Token.current).to eq(token)
  end
end
