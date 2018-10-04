# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trailer_vote/media_types/version'

Gem::Specification.new do |spec|
  spec.name          = 'trailer_vote-media_types'
  spec.version       = TrailerVote::MediaTypes::VERSION
  spec.authors       = ['Derk-Jan Karrenbeld']
  spec.email         = ['dj@trailervote.com']

  spec.summary       = 'Holds the defined media types for the TrailerVote ecosystem'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'media_types', '~> 0.5.5'

  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-ci'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'oj'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov'
end
