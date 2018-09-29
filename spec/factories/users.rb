FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password {FFaker::Internet.password(6)}
  end
end
