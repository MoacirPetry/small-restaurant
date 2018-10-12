FactoryBot.define do
  factory :table do
    status { Faker::Boolean.boolean(0) }
    limit { FFaker::Random.rand(2..20) }
  end
  factory :invalid_table, class: Table do
    limit { nil }
  end
end
