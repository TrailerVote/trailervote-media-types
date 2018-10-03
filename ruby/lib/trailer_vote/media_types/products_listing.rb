# frozen_string_literal: true

require_relative './base_text'

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
            collection :items do
              attribute :title, AllowNil(String)
              attribute :publish_date, AllowNil(String)

              link :product

              attribute :_embedded do
                attribute :image, allow_empty: true, expected_type: AllowNil(Hash) do
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
      end

      registrations :products_listing do
        type_alias 'products-listing'
      end
    end
  end
end
