# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class ProductTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.product.v2+json', Product.to_constructable.to_s
      end

      def test_it_registers
        assert_media_types_registered(Product) do
          formatted_mime_type 'application/vnd.trailervote.product.v%<version>s+json' do
            version 2, symbol: :product_v2_json, synonyms: ['application/vnd.trailervote.product.movie.v2+json']
            version 1, symbol: :product_v1_json, synonyms: ['application/vnd.trailervote.product.movie.v1+json']
          end

          formatted_mime_type 'application/vnd.trailervote.product.v%<version>s.%<view>s+json' do
            version 2 do
              create symbol: :create_product_v2_json, synonyms: ['application/vnd.trailervote.product.movie.v2.create+json']
              index symbol: :product_urls_v2_json, synonyms: ['application/vnd.trailervote.product.movie.v2.index+json']
              collection symbol: :products_v2_json, synonyms: ['application/vnd.trailervote.product.movie.v2.collection+json']
            end

            version 1 do
              create symbol: :create_product_v1_json, synonyms: ['application/vnd.trailervote.product.movie.v1.create+json']
              index symbol: :product_urls_v1_json, synonyms: ['application/vnd.trailervote.product.movie.v1.index+json']
              collection symbol: :products_v1_json, synonyms: ['application/vnd.trailervote.product.movie.v1.collection+json']
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
