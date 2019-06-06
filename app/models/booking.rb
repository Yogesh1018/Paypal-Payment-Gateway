class Booking < ApplicationRecord

  belongs_to :movie_ticket

  validates :first_name, :last_name, :card_type, presence: true

  attr_accessor :card_number, :card_verification, :card_expires_on

end
