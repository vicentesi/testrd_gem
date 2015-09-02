# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testrd_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "testrd_gem"
  spec.version       = TestrdGem::VERSION
  spec.authors       = ["Vicente Silveira Inácio"]
  spec.email         = ["silveira.vicente@gmail.com"]

  spec.summary       = %q{Resultados Digitais evaluation test ruby gem.}
  spec.homepage      = "https://github.com/vicentesi/testrd_gem"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "salesforce_bulk"
  spec.add_runtime_dependency "pg"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
end
