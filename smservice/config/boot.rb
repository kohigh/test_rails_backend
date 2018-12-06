ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' # Set up gems listed in the Gemfile.

Bundler.require
require 'yaml'

Dir['./lib/**/*.rb'].each { |f| require f }
require_relative './app'

Dir['./config/initializers/*.rb'].each { |f| require f }