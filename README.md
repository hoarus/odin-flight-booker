# README

## Getting Started
### Prequisites
Please install Rails, Git and Bundler.

### Clone and Run Application

* Clone this repo

```git clone https://github.com/hoarus/odin-flight-booker.git```

* Install the required gems

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
Run a local server:
```ruby
$ rails s
```
Open browser to view application:
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