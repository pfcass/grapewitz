# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => "admin@grapewitz.com", :password => "password")

Region.create!(:name => 'Unknown')

Brand.create(:name => 'Home Brew')
Store.create(:name => 'The Web')

Variety.create(:name => 'Burgundy', :color => 1, :fizz => 0)
Variety.create(:name => 'Bordeaux', :color => 1, :fizz => 0)
Variety.create(:name => 'Chardonnay', :color => 0, :fizz => 0)
Variety.create(:name => 'Champagne', :color => 0, :fizz => 1)
Variety.create(:name => 'Chablis', :color => 0, :fizz => 0)
Variety.create(:name => 'Rose', :color => 2, :fizz => 0)
Variety.create(:name => 'Cava', :color => 0, :fizz => 1)
Variety.create(:name => 'Cote du Rhone', :color => 1, :fizz => 0)
Variety.create(:name => 'Montepulciano', :color => 1, :fizz => 0)
Variety.create(:name => 'Chianti', :color => 1, :fizz => 0)
Variety.create(:name => 'Sauvignon Blanc', :color => 0, :fizz => 0)
Variety.create(:name => 'Shiraz', :color => 1, :fizz => 0)
Variety.create(:name => 'Prosecco', :color => 0, :fizz => 1)
