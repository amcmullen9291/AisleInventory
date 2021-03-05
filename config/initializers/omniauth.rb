Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :google, ENV['clientID'], ENV['clientSecret']
  end
  