class Booking < ApplicationRecord
  has_many :flights
  has_many :passenger_bookings, dependent: :destroy
  has_many :passengers, through: :passenger_bookings

  accepts_nested_attributes_for :passengers

  before_validation :find_or_create_passenger

  private

  def find_or_create_passenger
    self.passengers = self.passengers.map do |passenger|
      Passenger.find_or_create_by(email: passenger.email, name: passenger.name)
    end
  end
end
