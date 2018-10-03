# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class ClientConfiguration < BaseText
      media_type 'client_configuration', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :configuration do
            attribute :place, String
            attribute :persona, String
          end
        end
      end

      registrations :client_configuration do
        versions 1
        type_alias 'client-configuration'
      end
    end
  end
end
