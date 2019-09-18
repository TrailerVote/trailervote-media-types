# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PlaceTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.place.v4+json', Place.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(Place) do
          formatted_mime_type 'application/vnd.trailervote.place.v%<version>s+json' do
            version 4, symbol: :place_v3_json, synonyms: []
            version 3, symbol: :place_v3_json, synonyms: []
            version 2, symbol: :place_v2_json, synonyms: []
            version 1, symbol: :place_v1_json, synonyms: []
          end

          formatted_mime_type 'application/vnd.trailervote.place.v%<version>s.%<view>s+json' do
            version 4 do
              view 'create', symbol: :create_place_v4_json, synonyms: []
              view 'index', symbol: :place_urls_v4_json, synonyms: []
              view 'collection', symbol: :places_v4_json, synonyms: []
            end

            version 3 do
              view 'create', symbol: :create_place_v3_json, synonyms: []
              view 'index', symbol: :place_urls_v3_json, synonyms: []
              view 'collection', symbol: :places_v3_json, synonyms: []
            end

            version 2 do
              view 'create', symbol: :create_place_v2_json, synonyms: []
              view 'index', symbol: :place_urls_v2_json, synonyms: []
              view 'collection', symbol: :places_v2_json, synonyms: []
            end

            version 1 do
              view 'create', symbol: :create_place_v1_json, synonyms: []
              view 'index', symbol: :place_urls_v1_json, synonyms: []
              view 'collection', symbol: :places_v1_json, synonyms: []
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation Place
      end
    end
  end
end
