module PaymentGateway
  extend ActiveSupport::Concern

  def price_in_cents
    (amount*100).round
  end   

  def process_purchase
    if express_token.blank?
      STANDARD_GATEWAY.purchase(price_in_cents, credit_card, standard_purchase_options)
    else
      EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
    end
  end

  def standard_purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  def express_purchase_options
    {
      :ip => ip_address,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :brand              => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end


end