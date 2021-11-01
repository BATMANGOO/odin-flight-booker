class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.all.map { |a| [a.name, a.id] }

    # return if flight_params.empty?

    @flights = Flight.where(flight_params)
  end

  private

  def flight_params
    params.permit(:origin_id, :destination_id, :departure_date, :departure_time)
  end

end
