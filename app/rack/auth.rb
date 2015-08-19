class Auth
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    if key = req.params['token']
      if token = Token.find_by(key: key)
        Session.new(req.session).current_token = token
      else
        Session.new(req.session).current_token = nil
      end
    end
    @app.call(env)
  end
end
