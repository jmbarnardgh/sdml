Gem::Specification.new do |s|s
  s.name        = 'SDML'
  s.version     = '0.0.1'
  s.date        = '2020-02-19'
  s.summary     = "Markdown Language for Editing SRS Docs"
  s.description = "SDML is a markdown language which can be used to easily write, store, share, and curate business requirements, technical specifications, constraints, and other software project documentation element  s."
  s.authors     = ["Jacob Barnard"]
  s.email       = 'jmbarnardg1@gmail.com'
  s.files       = ["lib/tokens/super_tokens/token.rb"]
  s.homepage    = "https://github.com/jmbarnardgh/SDML"
  s.license      = 'Apache-2.0'
  s.add_development_dependency "require_all",
    [">= 1.3.3"]
end