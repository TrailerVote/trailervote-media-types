# frozen_string_literal: true

require 'media_types'

require_relative './base_text'
require_relative './types/product_image_type'
require_relative './types/boolean'

module TrailerVote
  module MediaTypes
    class ProductImage < BaseText
      media_type 'product.image', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          version_1_creation = ::MediaTypes::Scheme.new do
            attribute :identifier, String
            attribute :source_url, String
            attribute :deleted_at, AllowNil(String), optional: true
          end

          version_1_base = ::MediaTypes::Scheme.new do
            attribute :updated_at, String

            merge version_1_creation

            attribute :data do
              attribute :processed, Types::Boolean
              attribute :type, Types::ProductImageType

              not_strict
            end

            link :self
            link :original, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
            link :thumbnail, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
            link :xlarge, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
            link :large, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
            link :medium, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
            link :small, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
            link :xsmall, allow_nil: true, optional: true do
              attribute :content_digest, String
              attribute :width, Numeric
              attribute :height, Numeric
            end
          end

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
              collection :_embedded, version_1_base
              not_strict
            end
          end

          view :index do
            attribute :product_images do
              collection :_index do
                attribute :href, String
                not_strict
              end

              not_strict
            end
          end
        end
      end

      registrations :product_image do
        view 'create', :create_product_image
        view 'index', :product_image_urls
        view 'collection', :product_images

        type_alias 'product-image'
        type_alias 'image'
      end
    end
  end
end
