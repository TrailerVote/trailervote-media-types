# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class ReleasePushCampaignTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.release_push_campaign.v1+json', ReleasePushCampaign.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(ReleasePushCampaign) do
          formatted_mime_type 'application/vnd.trailervote.release_push_campaign.v%<version>s+json' do
            version 1, symbol: :release_push_campaign_v1_json, synonyms: []
          end

          formatted_mime_type 'application/vnd.trailervote.release_push_campaign.v%<version>s.%<view>s+json' do
            version 1 do
              view 'create', symbol: :create_release_push_campaign_v1_json, synonyms: []
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation ReleasePushCampaign
      end
    end
  end
end
