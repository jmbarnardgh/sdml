Gem::Specification.new do |s|s
  s.name        = 'System Design Markdown Language'
  s.version     = '0.0.1'
  s.date        = '2020-02-19'
  s.summary     = "Markup Language for System Design"
  s.description = "Language which can be used to easily write, store, share, and curate business requirements, technical specifications, constraints, and other system documentation elements."
  s.authors     = ["Jacob Barnard"]
  s.email       = 'jacob.barnard.software@gmail.com'
  s.files       = ["lib/**/*.rb"]
  s.homepage    = "https://github.com/jmbarnardgh/SDML"
  s.license      = 'Apache-2.0'
  s.add_development_dependency "require_all",
    [">= 1.3.3"]
end