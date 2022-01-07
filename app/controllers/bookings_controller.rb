class BookingsController < ApplicationController
 
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:selected_flight_id])
    @passengers_count = params[:number_of_passengers].to_i
    @passengers_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_path(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        @flight = Flight.find(params[:booking][:flight_id])
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
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