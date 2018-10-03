# frozen_string_literal: true

require_relative './base_text'
require 'media_types/scheme/any_of'

module TrailerVote
  module MediaTypes
    class ProductLookup < BaseText
      media_type 'product.lookup', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          collection 'product_identifiers', expected_type: nil do
            attribute :authority, String
            attribute :identifier
          end
        end
      end

      registrations(:product_lookup) do
        type_alias 'product-lookup'
      end
    end
  end
end
