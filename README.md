# README: FREE FLIGHT BOOKER

## Overview
I developed this project as part of the [Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker). It is intended to represent a small portion of the online flight search and booking process. I have stripped away all of the painful parts (advertisements, strongly encouraged upgrades and of course payment) and attempted to simplify the user experience as much as possible.

## Functionality

The application can be accessed [here](http://freeflightbooker.herokuapp.com/). Please note that it may take a few seconds to launch due to the hosting service I've used.

### Search for Flights

The user can search for free direct flights from select airports.

![Search](/readme_images/freeflightbooker1.jpg)


### Provide Passenger Details

Once the user has selected their flight of choice, they are required to enter the name and email address of all passengers.

![Search](/readme_images/freeflightbooker2.jpg)

### Confirm Booking

Once the user has confirmed their booking, they are presented with a booking confirmation page. In addition, a confirmation email is sent to all passengers.

![Search](/readme_images/freeflightbooker3.jpg)

## Technical Notes

I developed this project to practice a number of skills, including:
- Advanced forms to enable the creation of multiple data models simultaneously
- Active Record associations between multiple data models (e.g. Airports > Flights and Bookings > Passengers)
- Integration of a mailer add-on (Twilio Sendgrid)
- Responsive design
- Seeding a database

This project leverage the following technologies:
- Ruby on Rails
- Git & GitHub
- Heroku
- Twilio Sendgrid

## Installation
### Prequisites
This program requires the following:
- Ruby on Rails version 6.1.4.4
- Ruby version 2.7.4


### Set Up

Clone this repo:

```ruby
git clone https://github.com/hoarus/odin-flight-booker.git
```

Install the required gems:

```ruby
$ bundle install
```

Migrate the database:
```ruby
$ rails db:migrate
```
Populate the database with seeded airports and flights:
```ruby
$ rails db:seed
```

### Run the Application
Run the application locally:
```ruby
$ rails s
```
View your application in the browser:
```ruby
localhost:3000
```

## Support
For any questions in relation to the project, please reach out to me at hoarus@gmail.com