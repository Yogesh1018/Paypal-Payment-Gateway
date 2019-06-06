class Booking < ApplicationRecord

  require "active_merchant/billing/rails"
  include PaymentGateway

  belongs_to :movie_ticket

  validates :first_name, :last_name, :card_type, presence: true

  validate :validate_card
  delegate :price, :to => :movie_ticket, :allow_nil => true

  attr_accessor :card_number, :card_verification

  def purchase
    response = BrainTreeGatyeway.purchase(price_in_cents(price), credit_card)
  end

  def validate_card
    if !credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add(:base, message)
      end
    end
  end

end
