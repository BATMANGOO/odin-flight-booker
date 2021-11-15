class PassengerMailer < ApplicationMailer
  default from: 'flight-booker@flights.com'

  def confirmation_email
    @booking = Booking.find(params[:booking_id])
    @url = booking_url(@booking)
    mail(to: @booking.passengers.pluck(:email), subject: 'Thank you for booking your Flight!')
  end
end
