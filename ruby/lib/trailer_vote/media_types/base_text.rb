# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    class BaseText
      include ::MediaTypes::Dsl

      class << self

        protected

        BASE_TEXT_FORMAT = 'application/vnd.trailervote.%<type>s.v%<version>s.%<view>s+%<suffix>s'

        def base_format
          BASE_TEXT_FORMAT
        end
      end
    end
  end
end
