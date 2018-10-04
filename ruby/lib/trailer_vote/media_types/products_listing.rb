# frozen_string_literal: true

require_relative './base_text'
require_relative './partials/image_links'

module TrailerVote
  module MediaTypes
    class ProductsListing < BaseText
      media_type 'products_listing'

      defaults do
        suffix :json
        version 1
      end

      validations do
        version 1 do
          attribute :products_listing do
            collection :items, allow_empty: true do
              attribute :title, AllowNil(String)
              attribute :publish_date, AllowNil(String)

              link :product

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

      registrations :products_listing do
        type_alias 'products-listing'
      end
    end
  end
end
