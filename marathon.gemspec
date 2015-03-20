# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marathon/version'

Gem::Specification.new do |spec|
  spec.name          = 'marathon'
  spec.version       = Marathon::VERSION
  spec.authors       = ['Michal Cichra']
  spec.email         = ['michal@3scale.net']

  spec.summary       = %q{Ruby client for Marathon API}
  spec.description   = %q{No dependencies other than standard library}
  spec.homepage      = 'https://github.com/3scale/marathon-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  if spec.respond_to?(:metadata)

  end

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'

  # test dependencies
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
