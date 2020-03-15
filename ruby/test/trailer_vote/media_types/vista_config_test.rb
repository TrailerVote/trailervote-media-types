# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class VistaConfigTest < Minitest::Test

      def test_the_default_media_type
        assert_equal 'application/vnd.trailervote.vista_config.v1+json', VistaConfig.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(VistaConfig) do
          formatted_mime_type 'application/vnd.trailervote.vista_config.v%<version>s+json' do
            version 1, symbol: :vista_config_v1_json, synonyms: []
          end

          formatted_mime_type 'application/vnd.trailervote.vista_config.v%<version>s.%<view>s+json' do
            version 1 do
              view 'index', symbol: :vista_config_urls_v1_json, synonyms: []
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation VistaConfig
      end
    end
  end
end
