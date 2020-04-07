# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(File.join('..', 'lib'), __dir__)

# Loads gems from gemfile so you don't need bundle exec
ENV['BUNDLE_GEMFILE'] ||= File.expand_path(File.join('..', 'Gemfile'), __dir__)
require 'bundler/setup'
require 'awesome_print'
require 'oj'

if ENV['COVERAGE']
  # Setup for coverage
  require 'simplecov'

  SimpleCov.start do
    add_filter 'test'

    add_group 'TrailerVote Media Types', 'lib/trailer_vote'

    track_files '{lib}/**/*.rb'
  end

  if ENV['CIRCLE_ARTIFACTS']
    dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
    SimpleCov.coverage_dir(dir)
  end
end

# Autoload media types, as if someone was using this gem from the outside
require 'trailer_vote/media_types'
require 'trailer_vote/fixtures'

# Reports
require 'minitest/reporters'
Minitest::Reporters.use!

# Run at exit
require 'minitest/ci' if ENV['CI']
require 'minitest/autorun'
require_relative './trailer_vote/assertions'

FIXTURE_DIRECTORY = File.expand_path(File.join(__dir__, 'trailer_vote', 'fixtures'))

class Minitest::Test < Minitest::Runnable
  include MediaTypes::Assertions

  def load_fixture(media_type)
    path = File.join(FIXTURE_DIRECTORY, *media_type.split('/'))
    if File.exist?(path)
      return Oj.load_file(path, Oj.default_options)
    end

    TrailerVote::Fixtures.load(media_type).tap do |result|
      warn "no fixture for #{media_type}" unless result
    end
  end

  def assert_fixture_passes_validation(media_type)
    media_type.available_validations.each do |v|
      fixture = load_fixture(v.identifier)
      next unless fixture

      assert v.validate!(fixture)
    end
  end
end
