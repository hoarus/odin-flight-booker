class BookingsController < ApplicationController

  
  def new
    @booking = Booking.new
    @flight = (Flight.find_by id: params[:selected_flight_id])
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = (Flight.find_by id: params[:booking][:flight_id])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end

   
  end

  
  def show
  end

  private
  def booking_params
    params.require(:booking).permit(
      :flight_id, 
      passengers_attributes: [:id, :name, :email])
  end
  
end
