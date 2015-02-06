Divebook::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Eager loading
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # mailer configuration
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => ENV["MANDRILL_USERNAME"],
    :password  => ENV["MANDRILL_API_KEY"]
  }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true
end
