class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passengers = params[:passengers]
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render :show
    else
      redirect_to new_passenger_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger)
  end

end
