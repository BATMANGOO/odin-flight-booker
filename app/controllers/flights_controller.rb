class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.all.map { |a| [a.name, a.id] }

    return if flight_params.empty?

    @flights = Flight.where(flight_params)
    @booking_options = find_booking_choices
  end

  private

  def flight_params
    params.permit(:origin_id, :destination_id, :departure_date, :departure_time)
  end

  def find_booking_choices
    if params[:origin_id] == params[:destination_id]  
      flash[:notice] = "Origin and destination cannot be the same"
      render :index
    else
      BookingsHelper::BookingChoices.new(flight_params).find_flights
    end
  end
end
