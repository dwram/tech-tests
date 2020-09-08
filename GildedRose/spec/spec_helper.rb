require 'rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                   SimpleCov::Formatter::Console,
                                                               # Want a nice code coverage website? Uncomment this next line!
                                                               # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

require_relative '../lib/item-interface'
require_relative '../lib/items'
require_relative './helpers'


RSpec.configure do |config|



end
