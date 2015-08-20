FactoryGirl.define do
  factory :token do
    key "MyString"
    expires_at Time.parse("2015-08-05 00:51:23")
    name "MyString"
    admin false
    factory :admin_token do
      admin true
    end
  end

end
