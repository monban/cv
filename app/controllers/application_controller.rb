class ApplicationController < ActionController::Base
  include Tokens

  protect_from_forgery with: :exception

  def require_admin
    unless admin?
      render :status => :forbidden
    end
  end
end
