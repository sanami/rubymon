FactoryGirl.define do
  factory :user do
    full_name { FFaker::Name.name }
    email { FFaker::Internet.email(full_name) }
    password '12345678'
    confirmed_at { Time.now }
  end
end
