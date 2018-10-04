# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      ProductImageType = ::MediaTypes::Scheme.AnyOf(
        'backdrop',
        'poster'
      )

      # noinspection RubyConstantNamingConvention
      ProductImageTypeV1 = ::MediaTypes::Scheme.AnyOf(
        'backdrop',
        'poster',
        'Poster',
        'HeroMobileDynamic',
        'PosterDynamic',
        'HeroDesktopDynamic'
      )
    end
  end
end
