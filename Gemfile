# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'faker'
gem 'jwt'
gem 'rack-cors'
gem 'redis', '~> 4.0'

group :development do
  gem 'better_errors'
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'rspec-rails', '~> 6.0.0.rc1'
end

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7'
  gem 'rubocop-rspec'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
