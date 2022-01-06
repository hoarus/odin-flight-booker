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
    @booking = Booking.new(booking_params)
    #@passenger = @booking.passengers.build(booking_params[:passenger])

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
      passenger: [:name, :email])
  end
  
end
