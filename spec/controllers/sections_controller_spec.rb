require 'rails_helper'
require 'controllers/support/admin_only'
require 'models/support/section_spec_utilities'

RSpec.describe SectionsController, type: :controller do
  it_behaves_like("an admin controller", lambda { FactoryGirl.build(:section).extend(Section::Utilities) }, verify_partial_doubles: false)
end
