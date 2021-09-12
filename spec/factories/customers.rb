FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(digits: 10) }
  end
  factory :invalid_customer, class: Customer do
    name { nil }
  end
end
