# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Airports


Airport.delete_all


Airport.create(city: "Denver", code: "DEN")
Airport.create(city: "Jackson", code: "JAC")
Airport.create(city: "Rapid City", code: "RAP")
Airport.create(city: "Salt Lake City", code: "SLC")
Airport.create(city: "Sioux Falls", code: "FSD")
Airport.create(city: "Santa Fe", code: "SAF")


# Flights

Flight.delete_all
  #Duplicate for dates (December Only)
  date = 0
  31.times do 
    date +=1
    #Duplicate for times 
    6.times do |i|
      Flight.create(
        departure_airport: (Airport.find_by code: 'DEN'), arrival_airport: (Airport.find_by code: 'JAC'),
        duration: '1:30', start_datetime: "2022-12-#{date} [0#{9 + i * 2}:30:00]"
      )
    end
  end


# Bookings

Booking.delete_all

# Passengers

Passenger.delete_all