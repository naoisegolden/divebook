source 'https://rubygems.org'

# basic
gem 'rails', '4.2.0'
gem 'pg' # thanks to http://railscasts.com/episodes/342-migrating-to-postgresql

# simple form
gem 'simple_form'
gem 'country_select'

# devise
gem 'devise', '~> 3.4.1'
gem 'omniauth'
gem 'oauth2'
gem 'omniauth-facebook'

# geocoding
gem 'geocoder'

# monitoring
gem 'newrelic_rpm'

# ENV variables
gem 'dotenv-deployment'

#assets
gem 'uglifier', '>= 2.7.0'

gem 'sass-rails', '~> 4.0.2'
gem 'compass-rails'
gem 'zurb-foundation', '~> 3.1.1'
gem 'foundation-icons-sass-rails', github: "zaiste/foundation-icons-sass-rails", branch: "v2.x"
gem 'modular-scale', '1.0.2' # fixes incompatibility with old foundation

# Code Climate test coverage
gem "codeclimate-test-reporter", group: :test, require: nil

group :development do
  gem 'web-console', '~> 2.0'
  gem 'rails-footnotes'

  # Console
  gem 'pry-rails'
  gem 'hirb-unicode'
  gem 'awesome_print'

  # Chrome extensions
  gem 'meta_request', '~> 0.3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'annotate'
end

group :development, :test do
  gem 'letter_opener'
end
