FactoryBot.define do
  factory :report do
    title       { Faker::String.random(length: 1..15) }
    headline    { Faker::String.random(length: 1..140) }
    text        { Faker::String.random(length: 1..1000) }
    date        { Faker::Date.between(from: '2021-01-01', to: Date.today) }
    format_id   { Faker::Number.between(from: 2, to: 4) }
    category_id { Faker::Number.between(from: 2, to: 7) }
    gimei = Gimei.name
    receiver    { gimei }

    association :user
  end
end
