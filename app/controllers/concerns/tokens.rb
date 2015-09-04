module Tokens
  extend ActiveSupport::Concern

  included do
    helper_method :current_token, :admin?
  end

  protected

  def current_token
    Session.new(session).current_token
  end

  def admin?
    current_token ? current_token.admin? : false
  end
end
