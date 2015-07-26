require 'rails_helper'

RSpec.describe Section, type: :model do
  it "has a unique title" do
    section = FactoryGirl.create(:section)
    expect(FactoryGirl.build(:section, title: section.title)).to_not be_valid
  end
end
