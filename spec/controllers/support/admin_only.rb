RSpec.shared_examples "forbids get" do |action|
  it "returns 403" do
    get action
    expect(response.code).to eq('403')
  end
end

RSpec.shared_examples "allows get" do |action|
  it "returns 200" do
    get action
    expect(response.code).to eq('200')
  end
end

RSpec.shared_examples "an admin controller" do
  before(:each) do
    # Disable double partial verification before each test to prevent "does not implement" errors
    # https://github.com/rspec/rspec-rails/issues/1076
    RSpec::Mocks.configuration.verify_partial_doubles = false
  end
  after(:each) do
    RSpec::Mocks.configuration.verify_partial_doubles = true
  end
  context "without anyone logged in" do
    before(:each) do
      allow(subject).to receive(:admin?).and_return(false)
    end
    it_behaves_like "forbids get", :new
  end
  context "with admin logged in" do
    before(:each) do
      allow(subject).to receive(:admin?).and_return(true)
    end
    it_behaves_like "allows get", :new
  end
end
