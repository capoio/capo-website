source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'airbrake'
gem 'haml-rails'
gem 'jquery-rails'
gem 'squeel'
gem 'mysql2'
gem 'acts-as-taggable-on'
gem 'git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'puma'
end

group :development do
  gem 'capistrano-ext'
  gem 'openminds_deploy'
  gem 'quiet_assets'
  gem 'pry'
  gem 'rack-webconsole-pry'
end

group :development, :test do
  gem 'rspec-rails', ">= 2.0.1"
end
