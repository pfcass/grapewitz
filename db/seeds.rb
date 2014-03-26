# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => "grapewitz@gmail.com", :password => "Wine4all")
Invitee.create!([
                    {:email => 'pfcass@casswitz.com'},
                    {:email => 'grapewitz@gmail.com'},
                    {:email => 'artgrrl04@yahoo.com'},
                    {:email => 'casswitz@comcast.net'},
                    {:email => 'catwitz@yahoo.com'}
                ])
Region.create!(:name => 'Unknown')
Region.create!(:name => 'France')
Region.create!(:name => 'Italy')
Region.create!(:name => 'Germany')
Region.create!(:name => 'US')
Region.create!(:name => 'NZ')
Region.create!(:name => 'Australia')
Region.create!(:name => 'Spain')
Region.create!(:name => 'Portugal')
Region.create!(:name => 'US-California')
Region.create!(:name => 'France-Loire')
Region.create!(:name => 'Italy-Tuscany')


Brand.create(:name => 'Home Brew')

Store.create(:name => 'The Web')

Variety.create(:name => 'Burgundy',         :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Bordeaux',         :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Chardonnay',       :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Champagne',        :color => Variety::WHITE, :fizz => Variety::FIZZY)
Variety.create(:name => 'Chablis',          :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Rose',             :color => Variety::ROSE,  :fizz => Variety::STILL)
Variety.create(:name => 'Cava',             :color => Variety::WHITE, :fizz => Variety::FIZZY)
Variety.create(:name => 'Cote du Rhone',    :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Montepulciano',    :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Chianti',          :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Sauvignon Blanc',  :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Shiraz',           :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Pinot Noir',       :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Zinfandel',        :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Cabernet Sauvignon',:color => Variety::RED,  :fizz => Variety::STILL)
Variety.create(:name => 'Super Tuscan',     :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Valpolicella',     :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Nero d\'Avola',    :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Amarone',          :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Prosecco',         :color => Variety::WHITE, :fizz => Variety::FIZZY)
Variety.create(:name => 'Cabernet Franc',   :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'Barolo',           :color => Variety::RED,   :fizz => Variety::STILL)
Variety.create(:name => 'White Bordeauz',   :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Vouvrey',          :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Chenin Blanc',     :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Reisling',         :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Moscato',          :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Fiano',            :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Viognier',         :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Pino Blanc',       :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Pouilly Fume',     :color => Variety::WHITE, :fizz => Variety::STILL)
Variety.create(:name => 'Sancerre',         :color => Variety::WHITE, :fizz => Variety::STILL)
