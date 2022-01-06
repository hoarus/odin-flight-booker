# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Below I outline the expected data architecture:

Airports
  text: city
  text: code

  relationships:
  - has many flights AS arrivals
  - has many flights AS departures




Flights:
  text: code
  text: airline
  date: departure_date
  date: arrival_date
  time: departure_time
  time: arrival_time

  relationships:
    - belongs to: airport AS departure_airport
    - belongs to: airport AS arrival_airport
    - has many passengers

Passengers
  name: 
  age:
  email:
  
  relationships:
    - belongs to: booking

Bookings:
 - belongs to: flight
 - has_many passengers

A typical airline booking flow:

    Enter desired dates / airports and click “Search”
    Choose from among a list of available flights
    Enter passenger information for all passengers