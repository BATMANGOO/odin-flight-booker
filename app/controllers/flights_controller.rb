class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = Airport.all.map { |a| [a.full_name, a.id] }

    # return if flight_params.empty?

    @flights = Flight.where(flight_params)
  end
end
