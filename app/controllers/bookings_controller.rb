class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking_choice = Flight.find(params[:booking_option])
    passenger_count = params[:num_tickets].to_i
    passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @flights = Flight.find(params[:booking][:booking_option])
    @booking.flight_id = @flights

    if @booking.save
      flash[:notice] = 'Booking was successfully created.'
      redirect_to @booking
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: [:name, :email])
  end
end
