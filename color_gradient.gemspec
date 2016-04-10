# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_gradient/version'

Gem::Specification.new do |spec|
  spec.name    = "color_gradient"
  spec.version = ColorGradient::VERSION
  spec.authors = ["Daniel Hollands", "Tom Pesman"]
  spec.email   = ["daniel@limeblast.co.uk", "tom@tnux.net"]

  spec.summary     = %q{Gradient calculation using Color gem objects.}
  spec.homepage    = "https://github.com/LimeBlast/color_gradient"
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "color", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard", "~> 2.13"
  spec.add_development_dependency "guard-rspec", "~> 4.6"
end
