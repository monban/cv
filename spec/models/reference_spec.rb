require 'rails_helper'

RSpec.describe Reference, type: :model do
  context "with an otherwise valid reference" do
    before :each do
      @ref = FactoryGirl.build(:reference)
    end
    it "has a valid default factory" do
      expect(@ref).to be_valid
    end
    it "is invalid without a telephone number" do
      @ref.telephone = ''
      @ref.valid?
      expect(@ref.errors[:telephone]).to_not be_blank
    end
    it "is invalid without a name" do
      @ref.name = ''
      @ref.valid?
      expect(@ref.errors[:name]).to_not be_blank
    end
  end
end
