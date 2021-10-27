# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeding...'

Airport.find_or_create_by(code: "SFO", name: "San Francisco, CA")
Airport.find_or_create_by(code: "NYC", name: "New York City, NY")
Airport.find_or_create_by(code: "ATL", name: "Atlanta, GA")
Airport.find_or_create_by(code: "ORD", name: "Chicago, IL")
Airport.find_or_create_by(code: "LAX", name: "Los Angeles, CA")
Airport.find_or_create_by(code: "DFW", name: "Dallas, TX")
Airport.find_or_create_by(code: "MCO", name: "Orlando, FL")
Airport.find_or_create_by(code: "DEN", name: "Denver, CO")

start = Time.zone.today
finish = Time.zone.today + 31.days

(start..finish).each do |date|
  flight_generator = FlightsHelper::FlightGenerator.new(date)
  flight_generator.call
end

puts 'seeding done'
