class BookingsController < ApplicationController
  def new
    @booking = Booking.new 
      params[:passengers].to_i.times { @booking.passengers.build }
    @passenger_count = 0
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      PassengerMailer.with(booking_id: @booking.id).confirm_email.deliver_now
      redirect_to @booking
    else
      redirect_to new_passenger_path, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :id,
      passengers_attributes: [:name, :email])
  end

end
