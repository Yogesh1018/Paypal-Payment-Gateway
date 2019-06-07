module PaypalRecurringPayment
  extend ActiveSupport::Concern

  def checkout_details
    process :checkout_details
  end
  
  def checkout_url(options)
    process(:checkout, options).checkout_url
  end
  
  def make_recurring
    process :request_payment
    process :create_recurring_profile, period: :monthly, frequency: 1, start_at: Time.zone.now, amount: self.plan.amount
  end
  
  def get_cycle
    if self.price
      cycle = self.price/self.subscription_amount
      if (self.price % self.subscription_amount) == 0
        cycle
      else
        cycle + 1
      end
    end
  end

private

  def process(action, options = {})
    options = options.reverse_merge(
      token: self.express_token,
      payer_id: self.express_payer_id,
      description: self.book_title,
      amount: self.price, 
      currency: "USD"
    )
    response = PayPal::Recurring.new(options).send(action)
    raise response.errors.inspect if response.errors.present?
    response
  end

end