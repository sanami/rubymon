FactoryGirl.define do
  factory :authentication do
    user
    provider 'test'
    sequence(:uid) {|n| "uid#{n}" }
  end
end
