Airbrake.configure do |config|
  config.api_key = '11f329a4c65418dd3c8124b65c291975'
  config.host    = 'errbit.openminds.be'
  config.port    = 443
  config.secure  = config.port == 443
end
