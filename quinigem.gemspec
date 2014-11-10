# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quinigem/version'

Gem::Specification.new do |spec|
  spec.name          = "quinigem"
  spec.version       = Quinigem::VERSION
  spec.authors       = ["Cristian Molina"]
  spec.email         = ["megatux@gmail.com"]
  spec.summary       = %q{Argentina Quiniela Scrapper}
  spec.description   = %q{Gem to scrap the Quiniela results from http://www.loteria-nacional.gov.ar}
  spec.homepage      = "https://github.com/megatux/quinigem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri", "~> 1.6.3.1"
end
