class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = (Flight.find_by id: params[:selected_flight_id])
    @number_of_passengers = params[:number_of_passengers].to_i

    @number_of_passengers.times do |i|
      instance_variable_set("@passenger#{i + 1}", Passenger.new)
    end
  end

  def create
  end
end
