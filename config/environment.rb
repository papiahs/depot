# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

Depot::Application.configure do 
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => "plain",
    :user_name => "s@gmail.com",
    :password => "pepe pompin",
    :enable_startttls_auto => true
  }
  
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_charset = 'utf-8'
  
end
