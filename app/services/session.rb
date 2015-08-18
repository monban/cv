class Session
  def initialize(session)
    @session = session
  end
  
  def current_token
    Token.find_by(id: @session['token_id'])
  end

  def current_token=(token)
    @session['token_id'] = token.id
  end
end
