class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @departure_options = Flight.all.map{ |flight| [ flight.departure_airport.city ] }.uniq
    @arrival_options = Flight.all.map{ |flight| [ flight.arrival_airport.city ] }.uniq
    @date_options = Flight.all.map{ |flight| [ flight.start_datetime ] }.uniq

    if(params.include?(:departure_airport))
      @departure_city =  (Airport.find_by city: params[:departure_airport])
      @flights = @flights.where(departure_airport: @departure_city )
    end

    if(params.include?(:arrival_airport))
      @arrival_city =  (Airport.find_by city: params[:arrival_airport])
      @flights = @flights.where(arrival_airport: @arrival_city )
    end

    if(params.include?(:date) && (params[:date] != ""))
      # @flights = @flights.where("start_datetime LIKE ?", params[:date] + "%")
    end


  end
end
