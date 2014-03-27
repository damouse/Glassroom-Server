source 'https://rubygems.org'

gem 'rails', '4.0.2'

#UI 
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'simple_form'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

#Authorization/Authentication
gem 'bcrypt-ruby', '3.1.2'
gem 'devise'
gem 'cancancan', '~> 1.7'

#API
gem 'jbuilder', '~> 1.2'

#misc
gem 'turbolinks'
gem 'jquery-rails'
gem "therubyracer"

group :production do
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end

group :development, :test do
	gem 'sqlite3'
	gem 'rspec-rails', '~> 3.0.0.beta'
	gem 'api_taster'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.2.0'
  gem 'shoulda-matchers'
end

group :doc do
  gem 'sdoc', require: false
end
