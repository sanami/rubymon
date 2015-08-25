# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  if ENV['DB_SEED_DATA'] =~ /true|on/i
    puts 'Seeding test data'

    (1..7).each do |i|
      User.create email: "user#{i}@example.com" do |user|
        user.full_name = FFaker::Name.name
        user.password = '12345678'
        user.skip_confirmation!
      end
    end

  end

end

ActiveRecord::Base.descendants.each {|x| puts "#{x.name}: #{x.count}" rescue nil }
