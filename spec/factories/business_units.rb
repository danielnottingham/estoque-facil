FactoryBot.define do
  factory :business_unit do
    name { Faker::Name.unique.name }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    address { Faker::Address.street_name }
  end
end
