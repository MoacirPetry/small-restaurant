FactoryBot.define do
  factory :table do
    status { Faker::Boolean.boolean(true_ratio: 0.0) }
    limit { Faker::Number.between(from: 2, to: 20) }
  end
  factory :invalid_table, class: Table do
    limit { nil }
  end
end
