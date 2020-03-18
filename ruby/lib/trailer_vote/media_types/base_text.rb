# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    class BaseText
      include ::MediaTypes::Dsl

      class << self

        def organisation
          'trailervote'
        end
      end
    end
  end
end
