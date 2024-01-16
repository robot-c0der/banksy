source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.2.2'
gem 'rails', '~> 7.0.8'

gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'jbuilder', '~> 2.11', '>= 2.11.5'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '~> 5.0'

gem 'rubocop-rails', '~> 2.23', '>= 2.23.1', require: false
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]



# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'


# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
  gem 'web-console'

  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rails', '~> 1.4'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
  gem 'ed25519', '~> 1.3'
  gem 'bcrypt_pbkdf', '~> 1.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]

  gem 'capybara'
  
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end