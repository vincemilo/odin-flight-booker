class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passengers = params[:passengers]
    #@passenger = Passenger.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger)
  end

end
