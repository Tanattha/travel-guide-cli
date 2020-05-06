require_relative './lib/travel_guide/version'

Gem::Specification.new do |spec|
  spec.name          = 'travel_guide'
  spec.version       = TravelGuide::VERSION
  spec.authors       = ["Tanattha"]
  spec.email         = ["tanattha.thuenim@gmail.com"]

  spec.summary       = "Travel Guide"
  spec.description   = "Guide places that you want to check out"
  spec.homepage      = "https://github.com/Tanattha/travel-guide-cli"
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.license       = "MIT"
  spec.files         = ["lib/travel_guide.rb", "lib/travel_guide/cli.rb", "lib/travel_guide/scraper.rb", "lib/travel_guide/places.rb", "config/environment.rb"]
  spec.executables << 'travel_guide'
  
  #spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  #spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
   # `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #end
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  #spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", ">= 1.10.8"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "open-uri"
  spec.add_development_dependency "colorize"
  spec.add_development_dependency 'artii', '~> 2.1', '>= 2.1.2'

  
end
