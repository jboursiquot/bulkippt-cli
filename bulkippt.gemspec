# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bulkippt/version'

Gem::Specification.new do |gem|
  gem.name          = "bulkippt-cli"
  gem.version       = Bulkippt::VERSION
  gem.authors       = ["Johnny Boursiquot"]
  gem.email         = ["jboursiquot@gmail.com"]
  gem.description   = %q{BulkipptCLI offers a command line interface alternative to using the Bulkippt gem in your application. If you just need to import your bookmarks from a CSV into your kippt.com account with a single one-liner from your shell, this is your tool.}
  gem.summary       = %q{BulkipptCLI offers a command line interface alternative to using the Bulkippt gem in your application. If you just need to import your bookmarks from a CSV into your kippt.com account with a single one-liner from your shell, this is your tool.}
  gem.homepage      = "https://github.com/jboursiquot/bulkippt-cli"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'kippt','~> 1.1.0'
  gem.add_runtime_dependency 'bulkippt','~> 0.0.2'
  gem.add_runtime_dependency 'thor'

  gem.add_development_dependency 'rake','~> 0.9'
  gem.add_development_dependency 'rspec','~> 2.11'
  gem.add_development_dependency 'fivemat', '~> 1.1'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-debugger'

end
