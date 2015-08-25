json.array!(@monsters) do |monster|
  json.extract! monster, :id, :user_id, :team_id, :monster_type_id, :monster_name, :monster_power
  json.url monster_url(monster, format: :json)
end
