# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      ProductMovieHandler = ::MediaTypes::Scheme.AnyOf(
        'youtube',
        'url'
      )
    end
  end
end
