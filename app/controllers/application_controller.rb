class ApplicationController < ActionController::Base
  include Tokens

  protect_from_forgery with: :exception
end
