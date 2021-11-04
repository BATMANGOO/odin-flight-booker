# frozen_string_literal: true

module BookingsHelper
  class BookingChoices
    def initialize(params)
      @origin = Airport.find_by(id: params[:origin_id])
      @destination = Airport.find_by(id: params[:destination_id])
      @departure_date = params[:departure_date]
    end

    def find_flights
      get_booking_choices(@origin, @destination, @departure_date)
    end

    def get_booking_choices(origin, destination, departure_date)
      @booking_choices = Flight.where(
        origin_id: origin,
        destination_id: destination,
        departure_date: departure_date
      ).collect { |flight| [flight] }
    end
  end
end

def passenger_info
  @passenger_info = @booking.passengers.collect do |passenger|
    [passenger.name, passenger.email]
  end
end
