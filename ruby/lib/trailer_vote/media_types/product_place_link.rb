# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes
    class ProductPlaceLink < BaseText
      use_name 'product_place_link'

      validations do
        version 1 do

          attribute :product_place_link do
            link :place
            link :product
          end

          view 'create' do
            attribute :place, Types::HttpUrl
          end

          view 'collection' do
            attribute :product_place_links do
              attribute :_embedded, expected_type: Array do
                any
                not_strict
              end
            end
          end
        end
      end
    end
  end
end
