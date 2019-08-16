# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PushTrivialCampaignTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.push_campaign_trivial.v1+json', PushTrivialCampaign.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(Issue) do
          formatted_mime_type 'application/vnd.trailervote.push_campaign_trivial.v%<version>s+json' do
            version 1, symbol: :push_campaign_trivial_v1_json, synonyms: []
          end

          formatted_mime_type 'application/vnd.trailervote.push_campaign_trivial.v%<version>s.%<view>s+json' do
            version 1 do
              view 'create', symbol: :create_push_campaign_trivial_v1_json, synonyms: []
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation PushTrivialCampaign
      end
    end
  end
end
