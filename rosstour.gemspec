# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rosstour/version'

Gem::Specification.new do |spec|
  spec.name          = "rosstour"
  spec.version       = Rosstour::VERSION
  spec.authors       = ["Maksim Burnin", "Mark Frost"]
  spec.email         = "maksim@hyper-dev.ru"

  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = ''
  end

  spec.summary       = %q{Ross Tour API wrapper for Ruby }
  spec.description   = %q{Just a ruby wrapper for API provided http://api.ross-tur.ru/}
  spec.homepage      = "https://github.com/hyprdev/rosstour"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "webmock", "~> 1.21"
  spec.add_development_dependency "sinatra", "~> 1.4"
  spec.add_development_dependency 'byebug' if RUBY_PLATFORM != 'java'

  spec.add_runtime_dependency "httparty", "~> 0.13.5"
end
