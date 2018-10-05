# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/vote_value'
require_relative 'types/iso8601'
require_relative 'partials/image_links'

module TrailerVote
  module MediaTypes
    class FeedbackListing < BaseText
      media_type 'feedback_listing'

      defaults do
        suffix :json
        version 1
      end

      validations do
        version 1 do
          attribute :feedback_listing do
            collection :items, allow_empty: true do
              attribute :title, AllowNil(String)
              attribute :value, Types::VoteValue
              attribute :updated_at, Types::Iso8601

              link :audio_fragment
              link :product
              link :persona
              link :feedback
              link :interactive_player

              attribute :image, expected_type: AllowNil(::Hash), allow_empty: true, optional: true do
                attribute :_embedded, expected_type: AllowNil(::Hash), allow_empty: true do
                  merge Partials::IMAGE_LINKS
                end
              end
            end

            link :self
          end
        end
      end

      registrations :feedback_listing do
        type_alias 'feedback-listing'
      end
    end
  end
end
