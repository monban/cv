FactoryGirl.define do
  factory :reference do
    name {Faker::Name.name}
    telephone {Faker::PhoneNumber.phone_number}
    email {Faker::Internet.email}
    relationship {['Peer', 'Supervisor'][rand(2)]}
    endorsement "I've worked with worse"
  end
end
