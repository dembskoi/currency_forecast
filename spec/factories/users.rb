FactoryGirl.define do
  factory :user do
    username Faker::Internet.unique.user_name
    email { Faker::Internet.email(username) }
    password Faker::Internet.password
  end
end
