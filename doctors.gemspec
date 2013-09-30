Gem::Specification.new do |s|
  s.name          = 'doctors'
  s.version       = '0.0.2'
  s.date          = '2013-09-30'
  s.summary       = "Find GPs using the NHS.uk organisation API"
  s.description   = "Client Gem for the NHS.uk organisation API tailored around searching for GP practices."
  s.authors       = ["Russell Dunphy", "Eva Barabas"]
  s.email         = ['russell@russelldunphy.com', 'b_seven_e@yahoo.co.uk']
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.homepage      = 'http://github.com/nhschoices/doctors'

  s.add_dependency "id"
  s.add_dependency "yajl-ruby"
  s.add_dependency "faraday"

  s.add_development_dependency "rspec"
  s.add_development_dependency "mocha"
  s.add_development_dependency "webmock"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "simplecov"

end
