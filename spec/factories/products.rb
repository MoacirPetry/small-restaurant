FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    category
  end
  factory :invalid_product, class: Product do
    name { nil }
  end
end
