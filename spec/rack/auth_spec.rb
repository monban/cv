describe "auth rack middleware" do
  include Rack::Test::Methods
  def app
    Resume::Application
  end
#  it "find the correct token" do
#    token = FactoryGirl.create(:token)
#    get '/'
#    expect(Token.current).to eq(token)
  #  end
  pending "is running the middleware"
end
