# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class ProductPlaceLink < BaseText
      media_type 'product_place_link', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do

          attribute :product_place_link do
            link :place
            link :product
          end

          view 'create' do
            attribute :place do
              attribute :id, String
            end
          end
        end
      end

      registrations do
        view 'collection', :product_place_links
        view 'create', :create_product_place_link
        view 'index', :product_place_link_urls

        type_alias 'place_product_link'
        type_alias 'place-product-link'
        type_alias 'product-place-link'
      end
    end
  end
end
