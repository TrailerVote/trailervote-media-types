# frozen_string_literal: true

require_relative './base_text'
require_relative './partials/image_links'

module TrailerVote
  module MediaTypes

    class Carousel < BaseText
      media_type 'carousel'

      defaults do
        suffix :json
        version 1
      end

      validations do
        version 1 do
          attribute :carousel do
            collection :items do
              attribute :title, AllowNil(String)
              attribute :image, expected_type: AllowNil(::Hash), allow_empty: true, optional: true do
                attribute :_embedded, expected_type: AllowNil(::Hash), allow_empty: true do
                  merge Partials::IMAGE_LINKS
                end
              end

              link :product
              link :video
              link :direct
              link :interactive_player
            end

            link :self
          end
        end
      end

      registrations(:carousel) {}
    end
  end
end
