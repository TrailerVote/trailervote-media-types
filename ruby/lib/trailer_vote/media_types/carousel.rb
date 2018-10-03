# frozen_string_literal: true

require_relative './base_text'

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
              attribute :_embedded do
                attribute :image, allow_empty: true, optional: true do
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
