source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '4.2.3'

# server
gem 'thin', group: [:development, :test]
gem 'unicorn', group: :production
gem 'figaro'

# data
gem 'pg'
gem 'sqlite3', group: [:development, :test]
gem 'simple_enum', '~> 2.0'
gem 'attribute_normalizer'
gem 'default_value_for', '~> 3.0'
gem 'kaminari'

# users
gem 'cancancan', '~> 1.9'
gem 'devise', '~> 3.2'
gem 'omniauth-facebook'

# assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3'
gem 'coffee-rails', '~> 4.1'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'
gem 'turbolinks'

# views
gem 'flutie'
gem 'simple_form', '~> 3.1'

# general
gem 'oj'
gem 'jbuilder', '~> 2.0'

# dev
gem 'awesome_print'
group :development, :test do
  # gem 'byebug'
  # gem 'web-console', '~> 2.0'
  gem 'spring-commands-rspec'
  gem 'rspec-rails', '~> 3.2'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'database_cleaner'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'capybara'
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
end
