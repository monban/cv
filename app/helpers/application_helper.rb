module ApplicationHelper
  def current_token
    Session.new(session).current_token
  end
  def admin?
    current_token ? current_token.admin? : false
  end
end
