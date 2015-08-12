class Auth
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    Token.set_current(req.params['token'])
    Rails.logger.debug req.params
    @app.call(env)
  end
end
