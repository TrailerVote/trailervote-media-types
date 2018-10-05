# frozen_string_literal: true

require 'media_types'

require_relative 'base_text'
require_relative 'types/boolean'
require_relative 'types/product_movie_type'
require_relative 'types/product_movie_handler'
require_relative 'types/iso8601'
require_relative 'types/https_url'

module TrailerVote
  module MediaTypes
    class ProductVideo < BaseText
      media_type 'product.video', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          version_1_creation = ::MediaTypes::Scheme.new do
            attribute :identifier, String
            attribute :source_url, Types::HttpsUrl
            attribute :deleted_at, AllowNil(Types::Iso8601), optional: true
          end

          version_1_base = ::MediaTypes::Scheme.new do
            attribute :updated_at, Types::Iso8601

            merge version_1_creation

            attribute :data do
              attribute :processed, Types::Boolean
              attribute :transcoded, Types::Boolean
              attribute :type, Types::ProductMovieType
              attribute :as, Types::ProductMovieHandler

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
                attribute :href, Types::HttpsUrl
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
