class Order < ApplicationRecord

  require "active_merchant/billing/rails"
  include PaymentGateway
  include PaypalRecurringPayment

  has_many :transactions, :class_name => "OrderTransaction"
  belongs_to :book
  belongs_to :plan, optional: true

  attr_accessor :card_number, :card_verification

  validate :validate_card

  def express_token=(token)
    write_attribute(:express_token, token)
    if new_record? && token.present?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end
  
  def purchase
    response = process_purchase
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    response.success?
  end

  def validate_card
    if express_token.blank? && !credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add(:base, message)
      end
    end
  end
end
