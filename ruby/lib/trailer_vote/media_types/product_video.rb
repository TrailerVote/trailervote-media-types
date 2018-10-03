# frozen_string_literal: true

require_relative './base_text'
require 'media_types/scheme/any_of'

module TrailerVote
  module MediaTypes
    class ProductVideo < BaseText
      media_type 'product.video', defaults: { suffix: :json, version: 1 }

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
              attribute :processed, AnyOf(TrueClass, FalseClass)
              attribute :transcoded, AnyOf(TrueClass, FalseClass)
              attribute :type, AnyOf('Trailer', 'Teaser', 'Rewards', 'Advert')
              attribute :as, AnyOf('youtube', 'url')

              not_strict
            end

            link :self
            link :audio_fragment do
              attribute :content_digest, String
            end
            link :direct, allow_nil: true, optional: true

            # link :original do
            #   attribute :content_digest, String
            #   attribute :width, Numeric
            #   attribute :height, Numeric
            # end
          end

          attribute :product_video do
            merge version_1_base
          end

          view 'create' do
            attribute :video do
              merge version_1_creation
              not_strict
            end
          end

          view 'collection' do
            attribute :videos do
              collection :_embedded, version_1_base
              not_strict
            end
          end

          view :index do
            attribute :product_videos do
              collection :_index do
                attribute :href, String
                not_strict
              end

              not_strict
            end
          end
        end
      end

      registrations :product_video do
        view 'create', :create_product_video
        view 'index', :product_video_urls
        view 'collection', :product_videos

        type_alias 'product-video'
        type_alias 'video'
      end
    end
  end
end
