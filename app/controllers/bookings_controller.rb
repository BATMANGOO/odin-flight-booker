class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking_choice = Flight.find(params[:booking_option])
    passenger_count = params[:num_tickets].to_i
    passenger_count.times { @booking.passengers.build }
  end

  # Fix create
  def create 
    flight_choice = params[:booking][:booking_option]
    passenger_id = Passenger.find_by(email: params[:booking][:passengers_attributes][][:email]).id
    @booking = Booking.new(flight_id: flight_choice, passenger_id: passenger_id)
    
    if @booking.save
      flash[:notice] = 'Booking was successfully created.'
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    return if @booking

    flash[:alert] = "Sorry, this booking does not exist."
    redirect_to root_url
  end

  private

  def find_flights(booking_option)
    flight_numbers = booking_option.split
    flight_numbers.collect { |num| Flight.find_by(id: num) }
  end

  def passenger_params
    params.require(:booking).permit(passengers_attributes: [:name, :email])
  end
end
