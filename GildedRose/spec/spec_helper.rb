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

require_relative '../lib/gilded-rose'



RSpec.configure do |config|


end