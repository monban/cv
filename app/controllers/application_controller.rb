class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_token, :admin?

  protected

  def current_token
    Session.new(session).current_token
  end
  def admin?
    current_token ? current_token.admin? : false
  end
end
