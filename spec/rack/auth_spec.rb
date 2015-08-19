require 'rails_helper.rb'

class MockApp
  attr_reader :request
  def initialize
    @request = OpenStruct.new
    @request.session = {}
  end
  def call(env)
    @request = Rack::Request.new(env)
    puts @request
    [ 200, {'Content-Type' => 'text/plain'}, []]
  end
end

describe Auth do
  before(:each) do
    @app = MockApp.new
    @token = FactoryGirl.create(:token)
    @auth = Auth.new(@app)
    @env = Rack::MockRequest.env_for('/',
                       {params: {'token' => @token.key}})
  end

  it 'sets the token in the session' do
    expect { @auth.call(@env) }.
      to change{@app.request.session['token_id']}.
      from(nil).to(@token.id)
  end
end
