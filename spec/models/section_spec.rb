require 'rails_helper'

RSpec.describe Section, type: :model do
  it "has a unique title" do
    Section.create({title: 'foo', content: 'bar'})
    expect(Section.new({title: 'foo', content: 'bar'})).to_not be_valid
  end
end
