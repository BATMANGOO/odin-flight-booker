class Passenger < ApplicationRecord
  has_many :passenger_bookings, dependent: :delete_all
  has_many :bookings, through: :passenger_bookings
  has_many :flights, through: :bookings

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
