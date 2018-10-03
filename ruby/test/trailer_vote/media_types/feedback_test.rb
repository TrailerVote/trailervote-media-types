# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class FeedbackTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.feedback.v1+json', Feedback.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(Feedback) do
          formatted_mime_type 'application/vnd.trailervote.feedback.v%<version>s+json' do
            version 1, symbol: :feedback_v1_json
          end

          formatted_mime_type 'application/vnd.trailervote.feedback.v%<version>s.%<view>s+json' do
            version 1 do
              view 'create', symbol: :create_feedback_v1_json
              view 'collection', symbol: :feedback_collection_v1_json
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation Feedback
      end
    end
  end
end
