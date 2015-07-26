FactoryGirl.define do
  factory :section do
    title { Faker::App.name }
    content { Faker::Hacker.say_something_smart }
  end
end
