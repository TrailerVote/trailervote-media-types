# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PushTokenIosTest < Minitest::Test

      def test_the_default_media_type
        assert_equal 'application/vnd.trailervote.push_token_ios.v1+json', PushTokenIos.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(PushTokenIos) do
          formatted_mime_type 'application/vnd.trailervote.push_token_ios.v%<version>s+json' do
            version 1, symbol: :push_token_ios_v1_json, synonyms: []
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation PushTokenIos
      end
    end
  end
end
