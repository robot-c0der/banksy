source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.1.2"

gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false

gem 'bootstrap', '~> 5.3.2'
gem 'dartsass-rails'
gem 'dartsass-sprockets'
gem "importmap-rails"
gem 'pg', '~> 1.5', '>= 1.5.4'
gem "puma", "~> 6.4", '>= 6.4.2'
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  
  gem "capistrano", "~> 3.11", require: false
  gem "capistrano-rails", "~> 1.4"
  gem "capistrano-passenger", "~> 0.2.0"
  gem "capistrano-rbenv", "~> 2.1", ">= 2.1.4"
  gem "ed25519", "~> 1.3"
  gem 'bcrypt_pbkdf', '~> 1.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end




