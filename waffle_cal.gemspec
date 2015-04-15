# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waffle_cal/version'

Gem::Specification.new do |spec|
  spec.name          = "waffle_cal"
  spec.version       = WaffleCal::VERSION
  spec.authors       = ["Ricco Førgaard"]
  spec.email         = ["ricco@fiskeben.dk"]
  spec.summary       = "Vcal/ical creator"
  spec.description   = "Creates ical/vcal files."
  spec.homepage      = "http://fiskeben.dk"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "rspec", "~> 3.2"
end
