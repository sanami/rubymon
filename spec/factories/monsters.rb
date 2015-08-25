FactoryGirl.define do
  factory :monster do
    user
    monster_type
    sequence(:monster_name) {|n| "Monster #{n}" }
    monster_power 1
  end

end
