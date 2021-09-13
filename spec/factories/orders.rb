FactoryBot.define do
  factory :order do
    status { false }
    total { Faker::Number.decimal(l_digits: 2) }
    customer
    user
    table
  end
  trait :with_products do
    after(:create) do |order|
      create_list(:order_product, 3, order: order)
    end
  end
  factory :invalid_order, class: Order do
    user { nil }
  end
end
