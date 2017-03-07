# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.create({name: "San Francisco"})
City.create({name: "Los Angeles"})

cities = City.all

10.times do 
	User.create({email: Faker::Internet.email})
end

10.times do 
		Unit.create({
			serial: Faker::Vehicle.vin[0..6],
			city: cities.sample
		})
end
100.times do 
	starting = Faker::Date.between(1.year.ago, 1.year.from_now)
	ending = starting + rand(30)
	Booking.create({
		user: User.all.sample,
		unit: Unit.all.sample,
		starting: starting,
		ending: ending
	})
end