class BookingsController < ApplicationController
  def new
    @flight_id = params[:selected_flight_id]
    @passengers = params[:passengers]
  end
end
