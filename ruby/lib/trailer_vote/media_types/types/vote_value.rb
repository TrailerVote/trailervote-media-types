# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      VoteValue = ::MediaTypes::Scheme.AnyOf(
        'positive',
        'negative',
        'neutral',
        'skip'
      )
    end
  end
end
