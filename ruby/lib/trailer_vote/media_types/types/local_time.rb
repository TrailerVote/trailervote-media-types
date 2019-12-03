# frozen_string_literal: true

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      # |60 seconds notation needed to support leap second
      LocalTime = /^(0[0-9]|1[0-9]|2[0-3]|[0-9]):([0-5][0-9]|60)$/ # rubocop:disable Naming/ConstantName, Style/MutableConstant
    end
  end
end
