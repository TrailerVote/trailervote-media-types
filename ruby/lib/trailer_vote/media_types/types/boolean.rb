# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      Boolean = ::MediaTypes::Scheme.AnyOf(
        TrueClass,
        FalseClass
      )
    end
  end
end
