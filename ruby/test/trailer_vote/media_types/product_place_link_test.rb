# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class ProductPlaceLinkTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.product_place_link.v1+json', ProductPlaceLink.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(ProductPlaceLink) do
          formatted_mime_type 'application/vnd.trailervote.product_place_link.v%<version>s+json' do
            version 1, symbol: :poduct_place_link_v1_json, synonyms: %w[
              application/vnd.trailervote.place_product_link.v1+json
              application/vnd.trailervote.place-product-link.v1+json
              application/vnd.trailervote.product-place-link.v1+json
            ]
          end

          formatted_mime_type 'application/vnd.trailervote.product_place_link.v%<version>s.%<view>s+json' do
            version 1 do
              view 'collection', symbol: :product_place_links_v1_json, synonyms: %w[
                application/vnd.trailervote.place_product_link.v1.collection+json
                application/vnd.trailervote.place-product-link.v1.collection+json
                application/vnd.trailervote.product-place-link.v1.collection+json
              ]
              view 'create', symbol: :create_product_place_link_v1_json,
                             synonyms: %w[
                               application/vnd.trailervote.place_product_link.v1.create+json
                               application/vnd.trailervote.place-product-link.v1.create+json
                               application/vnd.trailervote.product-place-link.v1.create+json
                             ]
              view 'index', symbol: :product_place_link_urls_v1_json, synonyms: %w[
                application/vnd.trailervote.place_product_link.v1.index+json
                application/vnd.trailervote.place-product-link.v1.index+json
                application/vnd.trailervote.product-place-link.v1.index+json
              ]
            end
          end
        end
      end

      def test_fixtures
        assert_fixture_passes_validation ProductPlaceLink
      end
    end
  end
end
