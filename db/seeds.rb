# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Airports


Airport.delete_all


Airport.create(city: "Sydney", code: "SYD")
Airport.create(city: "Brisbane", code: "BNE")
Airport.create(city: "Gold Coast", code: "OOL")
Airport.create(city: "Canberra", code: "CBR")
Airport.create(city: "Hobart", code: "HOB")
Airport.create(city: "Melbourne", code: "MEL")


# Flights

Flight.delete_all

  5.times do |i|
    Flight.create(
      departure_airport: (Airport.find_by code: 'BNE'), arrival_airport: (Airport.find_by code: 'SYD'),
      duration: '1:30', start_datetime: "2021-12-25 [0#{9 + i * 2}:30:00]"
    )
    Flight.create(
      departure_airport: (Airport.find_by code: 'SYD'), arrival_airport: (Airport.find_by code: 'BNE'),
      duration: '1:30', start_datetime: "2021-12-25 [0#{10 + i * 2}:40:00]"
    )
    Flight.create(
      departure_airport: (Airport.find_by code: 'BNE'), arrival_airport: (Airport.find_by code: 'MEL'),
      duration: '2:30', start_datetime: "2021-12-25 [0#{10 + i * 2}:20:00]"
    )
    Flight.create(
      departure_airport: (Airport.find_by code: 'MEL'), arrival_airport: (Airport.find_by code: 'BNE'),
      duration: '2:30', start_datetime: "2021-12-25 [0#{11 + i * 2}:15:00]"
    )
    Flight.create(
      departure_airport: (Airport.find_by code: 'SYD'), arrival_airport: (Airport.find_by code: 'MEL'),
      duration: '1:00', start_datetime: "2021-12-25 [0#{6 + i * 2}:00:00]"
    )
    Flight.create(
      departure_airport: (Airport.find_by code: 'MEL'), arrival_airport: (Airport.find_by code: 'SYD'),
      duration: '1:00', start_datetime: "2021-12-25 [0#{7 + i * 2}:30:00]"
    )
  end

# Bookings

Booking.delete_all

# Passengers

Passenger.delete_all