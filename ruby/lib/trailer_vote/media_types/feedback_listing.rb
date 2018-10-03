# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class Carousel < BaseText
      media_type 'feedback_listing'

      defaults do
        suffix :json
        version 1
      end

      validations do
        version 1 do
          collection :items do
            attribute :title, AllowNil(String)
            attribute :value, AnyOf('positive', 'negative', 'neutral', 'skip')
            attribute :updated_at, String

            link :audio_fragment
            link :product
            link :persona
            link :feedback
            link :interactive_player

            attribute :image, allow_empty: true do
              attribute :_embedded do
                link :self
                link :original
                link :thumbnail, optional: true
                link :xlarge, optional: true
                link :large, optional: true
                link :medium, optional: true
                link :small, optional: true
                link :xsmall, optional: true
              end
            end
          end

          link :self
        end
      end

      registrations :feedback_listing do
        type_alias 'feedback-listing'
      end
    end
  end
end
