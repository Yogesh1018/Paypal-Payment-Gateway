class AddRefToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :movie_ticket, foreign_key: true
  end
end
