PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = ENV["paypal_login_id"]
  config.password = ENV["paypal_password"]
  config.signature = ENV["paypal_signature"]
end