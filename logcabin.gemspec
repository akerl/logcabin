Gem::Specification.new do |s|
  s.name        = 'logcabin'
  s.version     = '0.1.3'
  s.required_ruby_version = '>= 2.6'

  s.summary     = 'Support dynamic loading of modules at runtime'
  s.description = 'Support dynamic loading of modules at runtime'
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/logcabin'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split

  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'fuubar', '~> 2.5.0'
  s.add_development_dependency 'goodcop', '~> 0.9.7'
  s.add_development_dependency 'rake', '~> 13.0.0'
  s.add_development_dependency 'rspec', '~> 3.11.0'
  s.add_development_dependency 'rubocop', '~> 1.35.0'
  s.metadata['rubygems_mfa_required'] = 'true'
end
