source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'rails', '~> 5.2.2'
gem 'pg', '~> 1.1', '>= 1.1.4'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3', '>= 4.3.1'
gem 'cocoon', '~> 1.2', '>= 1.2.12'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.6', '>= 4.6.1'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '>= 3.0'
gem 'puma', '~> 3.11'
gem 'rails-i18n', '~> 5.1', '>= 5.1.3'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 4.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end

group :development do
  gem 'brakeman'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-mini-profiler'
  gem 'rubocop', require: false
  gem 'reek'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pronto'
  gem 'pronto-rubocop', require: false
  gem 'pronto-brakeman', require: false
  gem 'pronto-reek', require: false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
