# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Client Configuration
    #
    # The client configuration media type is used when a client, such as the SDK clients, want to configure the
    # TrailerVote services. When accepted, the TrailerVote services may use the passed configurations to return specific
    # responses based on that configuration. For example, the {Configuration} from the root endpoint changed based on
    # the values.
    #
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
