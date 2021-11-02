class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.bigint :flight_id, null: false
      t.bigint :passenger_id, null: false

      t.timestamps
    end
  end
end
