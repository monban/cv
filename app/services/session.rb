class Session
  def initialize(session)
    @session = session
  end
  
  def current_token
    Token.find_by(id: @session['token_id'])
  end

  def current_token=(token)
    if token.nil?
      @session['token_id'] = nil
    else
      @session['token_id'] = token.id
    end
  end

  def admin?
    current_token.admin
  end
end
