FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Base.numerify('265082####') }
  end
end
