# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class OrderedFragmentTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.ordered_fragment.v1.index+json', OrderedFragment.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(OrderedFragment) do
          formatted_mime_type 'application/vnd.trailervote.ordered_fragment.v%<version>s+json' do
            version 1, symbol: :ordered_fragment_v1_json, synonyms: ['application/vnd.trailervote.ordered-fragment.v1+json']
          end

          formatted_mime_type 'application/vnd.trailervote.ordered_fragment.v%<version>s.%<view>s+json' do
            version 1 do
              view 'index',
                   symbol: :ordered_fragment_urls_v1_json,
                   synonyms: ['application/vnd.trailervote.ordered-fragment.v1.index+json']
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation(OrderedFragment)
      end
    end
  end
end
