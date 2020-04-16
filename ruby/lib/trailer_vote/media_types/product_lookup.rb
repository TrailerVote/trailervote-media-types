# frozen_string_literal: true

require_relative 'base_text'
require 'media_types/scheme/any_of'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Product Lookups
    #
    # The product lookup is used to find products by means of an authority and identifier. An identifier **MUST** be
    # unique for that authority. For example, on TMDb each movie has (at least) one identifier, but no two movies share
    # a TMDb identifier.
    #
    # Each product on TrailerVote can have any number of authority-identifier pairs, and a client **SHOULD** lookup a
    # product which each pair known simultaneously. For example, many movies on TMDb are also on IMDB and have an IMDB
    # identifier.
    #
    class ProductLookup < BaseText
      use_name 'product.lookup'

      validations do
        version 1 do
          collection :product_identifiers, expected_type: nil do
            attribute :authority, String
            attribute :identifier, String
          end
        end
      end
    end
  end
end
