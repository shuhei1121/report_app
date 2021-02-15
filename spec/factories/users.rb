FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    name                   { gimei }
    email                  { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password               { password }
    password_confirmation  { password }
    position               { Faker::Job.position }
  end
end
