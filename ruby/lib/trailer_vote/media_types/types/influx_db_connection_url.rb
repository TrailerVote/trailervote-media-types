# frozen_string_literal: true

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      InfluxDbConnectionUrl = %r{^https?:\/\/[^\s\/$.?#].[^\s]*$} # rubocop:disable Naming/ConstantName
    end
  end
end
