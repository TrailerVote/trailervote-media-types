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
  spec.homepage      = 'https://github.com/TrailerVote/trailervote-media-types'

  # noinspection RubyStringKeysInHashInspection
  spec.metadata = {
    'bug_tracker_uri'   => 'https://github.com/TrailerVote/trailervote-media-types/issues',
    'changelog_uri'     => 'https://github.com/TrailerVote/trailervote-media-types/blob/master/ruby/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/trailer_vote-media_types',
    'homepage_uri'      => 'https://github.com/TrailerVote/trailervote-media-types',
    'source_code_uri'   => 'https://github.com/TrailerVote/trailervote-media-types/blob/master/ruby',
  }

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5.1'

  spec.add_runtime_dependency 'media_types', '>= 0.6.0', '< 1'

  spec.add_development_dependency 'awesome_print', '~> 1.8'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-ci', '~> 3.4'
  spec.add_development_dependency 'minitest-reporters', '~> 1.3'
  spec.add_development_dependency 'oj', '~> 3.6'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'
  spec.add_development_dependency 'trailer_vote-fixtures', '~> 1.13.0'
end
