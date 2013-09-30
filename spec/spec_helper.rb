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

require 'spec/support/fixtures'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
