# frozen_string_literal: true

require_relative 'base_text'
require_relative 'partials/image_links'
require_relative 'types/product_image_type'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class SentimentFeedback < BaseText
      use_name 'sentiment_feedback'

      validations do

        version 2 do
          attribute :sentiment_feedback do
            attribute :title, String
            attribute :description, AllowNil(String)

            attribute :image, expected_type: AllowNil(::Hash), allow_empty: true, optional: true do
              attribute :_embedded do
                attribute :identifier, String
                attribute :updated_at, Types::Iso8601
                attribute :type, Types::ProductImageType

                merge Partials::IMAGE_LINKS
              end
            end

            link :self
            link :feedback
          end
        end

        version 1 do
          attribute :sentiment_feedback do
            attribute :title, String
            attribute :description, AllowNil(String)

            attribute :images do
              collection :_embedded, allow_empty: true do
                attribute :identifier, String
                attribute :updated_at, Types::Iso8601
                attribute :asset_type, Types::ProductImageTypeV1

                link :self
                link :original do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end
                link :thumbnail, optional: true do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end
                link :xlarge, optional: true do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end
                link :large, optional: true do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end
                link :medium, optional: true do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end
                link :small, optional: true do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end
                link :xsmall, optional: true do
                  attribute :content_digest, String
                  attribute :width, Numeric
                  attribute :height, Numeric
                end

                not_strict
              end
            end

            link :self
            link :feedback
          end
        end
      end
    end
  end
end
