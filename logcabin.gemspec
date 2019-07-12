Gem::Specification.new do |s|
  s.name        = 'logcabin'
  s.version     = '0.1.3'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Support dynamic loading of modules at runtime'
  s.description = 'Support dynamic loading of modules at runtime'
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/logcabin'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'fuubar', '~> 2.4.1'
  s.add_development_dependency 'goodcop', '~> 0.7.0'
  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'rspec', '~> 3.8.0'
  s.add_development_dependency 'rubocop', '~> 0.72.0'
end
