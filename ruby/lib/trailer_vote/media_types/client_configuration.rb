# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

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
      use_name 'client_configuration'

      validations do
        version 1 do
          attribute :configuration do
            attribute :place, Types::HttpUrl
            attribute :persona, Types::HttpUrl
          end
        end
      end

    end
  end
end
