class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'origin_id', inverse_of: :to_airport
  has_many :arriving_flights, class_name: 'Flight', foreign_key: 'destination_id', inverse_of: :from_airport
end
