class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirm_email
    @booking = Booking.find(params[:booking_id])
    @url = 'http://example.com/login'
    mail(to: @booking.passengers.pluck(:email), subject: "Booking confirmed for Flught #{@booking.flight_id}!")
  end
end
