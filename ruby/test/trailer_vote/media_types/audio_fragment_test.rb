# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class AudioFragmentTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.audio_fragment.v1+json', AudioFragment.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(AudioFragment) do
          formatted_mime_type 'application/vnd.trailervote.audio_fragment.v%<version>s+json' do
            version 1, symbol: :audio_fragment_v1_json, synonyms: ['application/vnd.trailervote.audio-fragment.v1+json']
          end

          formatted_mime_type 'application/vnd.trailervote.audio_fragment.v%<version>s.%<view>s+json' do
            version 1 do
              view 'index',
                   symbol: :audio_fragment_urls_v1_json,
                   synonyms: ['application/vnd.trailervote.audio-fragment.v1.index+json']
              view 'collection',
                   symbol: :audio_fragments_v1_json,
                   synonyms: ['application/vnd.trailervote.audio-fragment.v1.collection+json']
              view 'ordered',
                   symbol: :ordered_audio_fragment_urls_v1_json,
                   synonyms: ['application/vnd.trailervote.audio-fragment.v1.ordered+json']
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation(AudioFragment)
      end
    end
  end
end
