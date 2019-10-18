# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PushConsentTest < Minitest::Test

      def test_the_default_media_type
        assert_equal 'application/vnd.trailervote.push_consent.v1+json', PushConsent.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(PushConsent) do
          formatted_mime_type 'application/vnd.trailervote.push_consent.v%<version>s+json' do
            version 1, symbol: :push_consent_v1_json, synonyms: []
          end

          formatted_mime_type 'application/vnd.trailervote.push_consent.v%<version>s.%<view>s+json' do
            version 1 do
              view 'create', symbol: :create_push_consent_v1_json, synonyms: []
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation PushConsent
      end
    end
  end
end
