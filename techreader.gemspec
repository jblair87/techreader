# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'techreader/version'

Gem::Specification.new do |spec|
  spec.name          = "techreader"
  spec.version       = Techreader::VERSION
  spec.authors       = ["Jenna Mandel"]
  spec.email         = ["jenna.b.mandel@gmail.com"]

  spec.summary       = %q{Ruby gem that scrapes articles from tech related websites for daily Apple news}

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.files         = `git ls-files`.split("\n")
 spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
 spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
 spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
    spec.add_development_dependency "nokogiri"
 spec.add_development_dependency "pry"
end
