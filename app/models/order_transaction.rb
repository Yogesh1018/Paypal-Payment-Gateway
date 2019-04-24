class OrderTransaction < ApplicationRecord

  belongs_to :order
  
  serialize :params
  
  def response=(response)
    if response.class.name == "PayPal::Recurring::Response::ManageProfile"
      self.success       = response.success?
      self.message       = response.params[:L_LONGMESSAGE0]
      self.params        = response.params
    else
      self.success       = response.success?
      self.authorization = response.authorization
      self.message       = response.message
      self.params        = response.params
      # rescue ActiveMerchant::ActiveMerchantError => e
      #   self.success       = false
      #   self.authorization = nil
      #   self.message       = e.message
      #   self.params        = {}
      # end
    end
  end

end
