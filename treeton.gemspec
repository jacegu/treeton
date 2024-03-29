# -*- encoding: utf-8 -*-
require File.expand_path('../lib/treeton/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Javier Acero"]
  gem.email         = ["j4cegu@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "treeton"
  gem.require_paths = ["lib"]
  gem.version       = Treeton::VERSION

  gem.add_runtime_dependency 'treetop', '~>1.4'
  gem.add_development_dependency 'rspec'
end
