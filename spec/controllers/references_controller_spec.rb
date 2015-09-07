require 'rails_helper'
require 'controllers/support/admin_only'
require 'models/support/reference_spec_utilities'

RSpec.describe ReferencesController, type: :controller do
  it_behaves_like 'an admin controller', lambda { FactoryGirl.build(:reference).extend(Reference::Utilities) }, verify_partial_doubles: false
end
