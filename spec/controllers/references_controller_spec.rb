require 'rails_helper'
require 'controllers/support/admin_only'

RSpec.describe ReferencesController, type: :controller do
  it_behaves_like 'an admin controller'
end
