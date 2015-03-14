# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

urls = ['http://isithackday.com/arrpi.php','http://www.degraeve.com/cgi-bin/babel.cgi','http://www.degraeve.com/cgi-bin/babel.cgi']
dialects_list = ['Pirate', 'Yoda', 'Valley Girl']
dialects = dialects_list.zip( urls )
dialects.each do |dialect ,url|
  Dialect.create!(dialect: dialect ,translation_url: url )
end

puts "Default dialects created!"
