FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word   }
    description { Faker::Lorem.paragraphs }
  end
  factory :invalid_category, class: Category do
    name { nil }
  end
end
