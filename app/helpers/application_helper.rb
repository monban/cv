module ApplicationHelper
  def current_token
    Session.new(session).current_token
  end
end
