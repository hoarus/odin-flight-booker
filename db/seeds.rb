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