class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking_choice = Flight.find(params[:booking_option])
    passenger_count = params[:num_tickets].to_i
    passenger_count.times { @booking.passengers.build }
  end

  # Fix create
  def create
    @booking = Booking.new(passenger_params)

    if @booking.save
      flash[:notice] = "Booking created successfully."
      PassengerMailer.confirmation_email(@booking).deliver_now
      redirect_to @booking
    else
      flash[:alert] = "Sorry, there was a problem creating your booking."
      render :new
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
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
