Gem::Specification.new do |s|
  s.name        = 'armadillo'
  s.version     = '0.2.0'
  s.date        = '2016-09-05'
  s.summary     = 'Armadillo'
  s.description = 'An automated test tool'
  s.add_development_dependency "minitest", [">= 0"]
  s.authors     = ["Jeremy Rotter"]
  s.email       = 'jeremy.rotter@gmail.com'
  s.files       = ['lib/armadillo.rb',
                   'lib/armadillo/artifact.rb',
                   'lib/armadillo/script.rb',
                   'lib/armadillo/testplan.rb',
                   'lib/armadillo/testcase.rb']
  s.homepage    = 'https://github.com/jrotter/armadillo'
  s.license     = 'MIT'
end
