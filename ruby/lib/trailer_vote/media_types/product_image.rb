# frozen_string_literal: true

require 'media_types'

require_relative 'base_text'
require_relative 'types/product_image_type'
require_relative 'types/boolean'
require_relative 'types/iso8601'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes
    class ProductImage < BaseText
      use_name 'product.image'

      validations do
        version_1_creation = ::MediaTypes::Scheme.new do
          attribute :identifier, String
          attribute :source_url, AnyOf(Types::HttpUrl, String)
          attribute :expires_at, AllowNil(Types::Iso8601), optional: true

          attribute :content_language, AllowNil(String), optional: true
          attribute :content_region, AllowNil(String), optional: true
          attribute :data do
            attribute :processed, Types::Boolean
            attribute :type, Types::ProductImageType
            not_strict
          end
        end

        version_1_base = ::MediaTypes::Scheme.new do
          attribute :updated_at, Types::Iso8601

          merge version_1_creation

          link :self do
            attribute :type, Types::ProductImageType
          end

          %i[original thumbnail xlarge large medium small xsmall].each do |size|
            link size, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
          end
        end

        version 1 do
          attribute :product_image do
            merge version_1_base
          end

          view 'create' do
            attribute :product_image do
              merge version_1_creation
              not_strict
            end
          end

          view 'collection' do
            attribute :product_images do
              collection :_embedded, version_1_base, allow_empty: true
              not_strict
            end
          end

          view :index do
            attribute :product_images do
              collection :_index, allow_empty: true do
                attribute :href, Types::HttpUrl
                attribute :type, Types::ProductImageType
                not_strict
              end

              not_strict
            end
          end
        end
      end
    end
  end
end
