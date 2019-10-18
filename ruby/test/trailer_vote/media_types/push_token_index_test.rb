# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PushTokenIndexTest < Minitest::Test

      def test_the_default_media_type
        assert_equal 'application/vnd.trailervote.push_token_index.v1+json', PushTokenIndex.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(PushTokenIndex) do
          formatted_mime_type 'application/vnd.trailervote.push_token_index.v%<version>s+json' do
            version 1, symbol: :push_token_index_v1_json, synonyms: []
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation PushTokenIndex
      end
    end
  end
end
