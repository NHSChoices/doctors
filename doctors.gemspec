Gem::Specification.new do |s|
  s.name          = 'doctors'
  s.version       = '0.0.1'
  s.date          = '2013-09-30'
  s.summary       = "Find GPs using the NHS.uk organisation API"
  s.description   = "Client Gem for the NHS.uk organisation API tailored around searching for GP practices."
  s.authors       = ["Russell Dunphy"]
  s.email         = ['russell.dunphy@nhs.net']
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.homepage      = 'http://github.com/nhschoices/doctors'

  s.add_dependency "id"
  s.add_dependency "nokogiri"
  s.add_dependency "faraday"

  s.add_development_dependency "rspec"
  s.add_development_dependency "mocha"
  s.add_development_dependency "webmock"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "simplecov"

end
