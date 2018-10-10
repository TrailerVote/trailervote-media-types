# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class SentimentFeedbackTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.sentiment_feedback.v2+json', SentimentFeedback.to_constructable.to_s
      end

      def test_it_registers
        assert_registered_types(
          SentimentFeedback,
          'application/vnd.trailervote.sentiment_feedback.v2+json' => [
            :sentiment_feedback_v2_json, ['application/vnd.trailervote.feedback.sentiment.v2+json']
          ],
          'application/vnd.trailervote.sentiment_feedback.v1+json' => [
            :sentiment_feedback_v1_json, ['application/vnd.trailervote.feedback.sentiment.v1+json']
          ]
        )
      end

      def test_fixtures
        assert_fixture_passes_validation SentimentFeedback
      end
    end
  end
end
