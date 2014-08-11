# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ignore_get_content_type/version'

Gem::Specification.new do |spec|
  spec.name          = "ignore_get_content_type"
  spec.version       = Rack::IgnoreGetContentTypeVersion::VERSION
  spec.authors       = ["Connor Savage"]
  spec.email         = ["csavage@mdsol.com"]
  spec.summary       = %q{A short piece of middleware to ignore content type set on GET requests}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "rack"
end
