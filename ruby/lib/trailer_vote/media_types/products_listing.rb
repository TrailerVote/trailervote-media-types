# frozen_string_literal: true

require_relative 'base_text'
require_relative 'partials/image_links'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class ProductsListing < BaseText
      use_name 'products_listing'

      validations do
        version 1 do
          attribute :products_listing do
            collection :items, allow_empty: true do
              attribute :title, AllowNil(String)
              attribute :publish_date, AllowNil(Types::Iso8601)

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
    end
  end
end
