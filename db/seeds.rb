# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airport.destroy_all

Airport.create!([{
    code: 'ABQ'
},
{
    code: 'JFK'
},
{
    code: 'LAX'
}])

p "Created #{Airport.count} airports"

Flight.destroy_all

Flight.create!([{
    destination_airport: Airport.find_by(code: 'ABQ'),
    origin_airport: Airport.find_by(code: 'JFK'),
    departure_date: Date.today,
    departure_time: Time.zone.now + 2.hours,
    duration: 5
},
{
    destination_airport: Airport.find_by(code: 'LAX'),
    origin_airport: Airport.find_by(code: 'ABQ'),
    departure_date: Date.today + 1.day,
    departure_time: Time.zone.now + 3.hours,
    duration: 2
},
{
    destination_airport: Airport.find_by(code: 'JFK'),
    origin_airport: Airport.find_by(code: 'LAX'),
    departure_date: Date.today + 2.days,
    departure_time: Time.zone.now + 4.hours,
    duration: 6
}])

p "Created #{Flight.count} flights"