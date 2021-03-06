require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   SimpleCov::Formatter::Console,
                                                               # Want a nice code coverage website? Uncomment this next line!
                                                               # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

require_relative '../lib/database-connection'
require_relative '../app'

Capybara.app = App
Capybara.server_port = 4000

RSpec.configure do |config|



end
