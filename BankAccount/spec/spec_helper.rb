ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   SimpleCov::Formatter::Console,
                                                               # Want a nice code coverage website? Uncomment this next line!
                                                               # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

require_relative '../lib/transaction'
require_relative '../lib/printer'
require_relative '../lib/bankAccount'



RSpec.configure do |config|


end