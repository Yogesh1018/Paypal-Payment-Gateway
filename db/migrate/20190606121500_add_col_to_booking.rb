class AddColToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
    add_column :bookings, :card_type, :string
    add_column :bookings, :success, :boolean
    add_column :bookings, :message, :text
    add_column :bookings, :card_expires_on,:date

  end
end
