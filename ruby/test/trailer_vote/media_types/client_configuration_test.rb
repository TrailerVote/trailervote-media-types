# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class ClientConfigurationTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.client_configuration.v1+json',
                     ClientConfiguration.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(ClientConfiguration) do
          formatted_mime_type 'application/vnd.trailervote.client_configuration.v%<version>s+json' do
            version 1,
                    symbol: :client_configuration_v1_json,
                    synonyms: ['application/vnd.trailervote.client-configuration.v1+json']
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation ClientConfiguration
      end
    end
  end
end
