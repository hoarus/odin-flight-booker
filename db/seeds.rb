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
Airport.create(city: "Salt Lake City", code: "SLC")
Airport.create(city: "Sioux Falls", code: "FSD")
Airport.create(city: "Santa Fe", code: "SAF")


# Flights

Flight.delete_all
  airportCodes = ["DEN", "SLC", "FSD", "SAF"]
  # Duplicate for all departing airports
  for departingCode in airportCodes do
    # Duplicate for all arriving airports
    for arrivalCode in airportCodes do 
      # Duplicate for dates (December Only)
      date = 0
      unless departingCode == arrivalCode 
        25.times do 
          date +=1
          # Duplicate for times 
          5.times do |i|
            Flight.create(
              departure_airport: (Airport.find_by code: departingCode), arrival_airport: (Airport.find_by code: arrivalCode),
              duration: '1:30', start_datetime: "2022-12-#{date} [0#{9 + i * 2}:30:00]"
            )
          end
        end
      end
    end
  end


# Bookings

Booking.delete_all

# Passengers

Passenger.delete_all