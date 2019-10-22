# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class ConfigurationTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.configuration.v5+json', Configuration.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(Configuration) do
          formatted_mime_type 'application/vnd.trailervote.configuration.v%<version>s+json' do
            version 5, symbol: :configuration_v5_json
            version 4, symbol: :configuration_v4_json
            version 3, symbol: :configuration_v3_json
            version 2, symbol: :configuration_v2_json
            version 1, symbol: :configuration_v1_json
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation Configuration
      end
    end
  end
end
