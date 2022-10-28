# README: FREE FLIGHT BOOKER

## Overview
I developed this project as part of the [Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker). It is intended to represent a small portion of the online flight search and booking process. I have stripped away all of the painful parts (advertisements, strongly encouraged upgrades and of course payment) and attempted to simplify the user experience as much as possible.

## Functionality

The application can be accessed [here](http://freeflightbooker.herokuapp.com/). Please note that it may take a few seconds to launch due to the hosting service I've used.

### Search for Flights

The user can search for free direct flights from select airports.

![Search](/readme_images/flightbooker1.jpg)


### Provide Passenger Details

Once the user has selected their flight of choice, they are required to enter the name and email address of all passengers.

![Search](/readme_images/flightbooker2.jpg)

### Confirm Booking

Once the user has confirme their booking, they are presented with a Booking Confirmation page. In addition, a confirmation email is sent to all passengers.


## Getting Started
### Prequisites
Please install Rails, Git and Bundler.

### Clone and Run Application

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
Run the application locally:
```ruby
$ rails s
```
View your application in the browser:
```ruby
localhost:3000
```

## Old

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


      def test
    if @booking.save
      flash.notice = "Booking was successfully created."
      redirect_to @booking
    else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
    end
  end


WORKIGN COPY

    def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight_id])
    @passengers_count = params[:number_of_passengers].to_i
    @passengers_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking successfully completed!'
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'An error occured!'
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
 
  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end


@flights.order(:start_datetime).each do |flight|%>
          <tr>
            <td><%= radio_button_tag(:selected_flight_id, flight.id) %></td>
            <td><%= flight.departure_airport.city %></td>
            <td><%= flight.arrival_airport.city %></td>
            <td><%= flight.start_datetime.strftime("%d %b, %Y") %></td>
            <td><%= flight.start_datetime.strftime("%H:%M") %></td>
            <td><%= flight.duration.strftime("%H:%M") %></td>
            <td><%= (flight.start_datetime + flight.duration).strftime("%d %b, %Y") %></td>
            <td><%= (flight.start_datetime + flight.duration).strftime("%H:%M") %></td>
          </tr>
        <% end %>
      </table>
      <%= submit_tag("Book Flight", class: "submit-button") %>
    <% end %>