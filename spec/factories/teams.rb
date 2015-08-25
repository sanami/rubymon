FactoryGirl.define do
  factory :team do
    user
    sequence(:team_name) {|n| "Team #{n}" }
  end

end
