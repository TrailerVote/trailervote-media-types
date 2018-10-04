# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      ProductDataType = ::MediaTypes::Scheme.AnyOf(
        'movie',
        'book'
      )
    end
  end
end
