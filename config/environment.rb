# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_setting = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => "plain",
    
    :enable_startttls_auto => true
  }
  
end
