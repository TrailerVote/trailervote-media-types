# frozen_string_literal: true

module TrailerVote
  module MediaTypes
    class ProductPlaceLink < BaseText
      media_type 'product_place_link', defaults: { suffix: :json, version: 2 }

      validations do
        version 2 do

          attribute :product_place_link do
            link :self
            link :place
            link :product
            link :showings
          end

          view 'create' do
            attribute :place, Types::HttpUrl
          end
        end
        #
        # view 'collection' do
        #   attribute :product_place_links do
        #     collection :_embedded do
        #
        #     end
        #     # link :place
        #     link :self
        #   end
        # end

        version 1 do

          attribute :product_place_link do
            link :place
            link :product
          end

          view 'create' do
            attribute :place, Types::HttpUrl
          end
        end
      end

      registrations :product_place_link do
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
