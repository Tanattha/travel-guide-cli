require_relative './lib/travel_guide/version'

Gem::Specification.new do |spec|
  spec.name          = 'travel_guide'
  spec.version       = TravelGuide::VERSION
  spec.authors       = ["Tanattha"]
  spec.email         = ["tanattha.thuenim@gmail.com"]

  spec.summary       = "Travel Guide"
  spec.description   = "Guide places that you want to check out"
  spec.homepage      = "https://github.com/Tanattha/travel-guide-cli"
  spec.license       = "MIT"
  spec.files         = ["lib/travel_guide.rb", "lib/travel_guide/cli.rb", "lib/travel_guide/scraper.rb", "lib/travel_guide/places.rb", "config/environment.rb"]
  spec.executables << 'travel_guide'

  spec.add_dependency "nokogiri", ">= 1.10.8"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "open-uri"
  spec.add_development_dependency "colorize"
  spec.add_development_dependency 'artii', '~> 2.1', '>= 2.1.2'

end
