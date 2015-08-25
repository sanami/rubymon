FactoryGirl.define do
  factory :monster_type do
    sequence(:type_name) {|n| "type_#{n}" }
    sequence(:type_weakness) {|n| n }
  end
end
