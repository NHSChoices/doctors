module Fixtures
  extend self

  def method_missing(name, *args, &block)
    File.read "spec/fixtures/#{name}.json"
  end

end
