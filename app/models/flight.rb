class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'origin_id', inverse_of: :arriving_flights
  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'destination_id', inverse_of: :departing_flights
end
