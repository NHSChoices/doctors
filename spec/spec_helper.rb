require 'rspec'
require 'simplecov'
require 'coveralls'

SimpleCov.start do
  add_filter 'spec'
end

require 'doctors'

RSpec.configure do |c|
  c.order = :rand
  c.mock_with :mocha
end

