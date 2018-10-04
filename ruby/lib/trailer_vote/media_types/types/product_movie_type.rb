# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      ProductMovieType = ::MediaTypes::Scheme.AnyOf(
        'Trailer',
        'Teaser',
        'Rewards',
        'Advert'
      )
    end
  end
end
