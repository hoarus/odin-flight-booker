class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_options = Flight.all.map{ |flight| [ flight.departure_airport.city ] }.uniq
    @arrival_options = Flight.all.map{ |flight| [ flight.arrival_airport.city ] }.uniq
    @date_options = Flight.all.map{ |flight| [ flight.start_datetime ] }.uniq
  end
end
