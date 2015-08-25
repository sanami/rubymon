# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  %w(fire water earth electric wind).each.with_index do |name, i|
    MonsterType.create type_name: name, type_weakness: i+1
  end

end

ActiveRecord::Base.descendants.each {|x| puts "#{x.name}: #{x.count}" rescue nil }
