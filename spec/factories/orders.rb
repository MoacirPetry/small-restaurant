FactoryBot.define do
  factory :order do
    status { false }
    total { Faker::Number.decimal(2) }
    customer
    user
    table
  end
  factory :invalid_order, class: Order do
    user { nil }
  end
end
