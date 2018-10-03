# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class SentimentFeedback < BaseText
      media_type 'sentiment_feedback', defaults: { suffix: :json, version: 1 }

      validations do

        version 2 do
          attribute :sentiment_feedback do
            attribute :title, String
            attribute :description, AllowNil(String)

            attribute :image do
              attribute :_embedded, optional: true do
                attribute :identifier, String
                attribute :updated_at, String
                attribute :asset_type, AnyOf('backdrop', 'poster')

                link :self
                link :original
                link :thumbnail, optional: true
                link :xlarge, optional: true
                link :large, optional: true
                link :medium, optional: true
                link :small, optional: true
                link :xsmall, optional: true
              end

              attribute :authority, String
              attribute :identifier, String
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
                attribute :updated_at, String
                attribute :asset_type, AnyOf('backdrop', 'poster', 'Poster', 'HeroMobileDynamic', 'PosterDynamic', 'HeroDesktopDynamic')

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

      registrations :sentiment_feedback do
        type_alias 'feedback.sentiment'
      end
    end
  end
end
