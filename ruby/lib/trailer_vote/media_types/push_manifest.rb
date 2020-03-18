# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Type for Push Manifest
    #
    # The push manifest is a list of active push campaigns
    #
    class PushManifest < BaseText
      use_name 'push_manifest'

      validations do

        version 2 do
          attribute :push_manifest do
            collection :campaigns, allow_empty: true do
              link :audio_fragment, optional: true
              link :product, optional: true
              link :campaign
            end
          end
        end

        version 1 do
          attribute :push_manifest do
            collection :campaigns, allow_empty: true do
              link :audio_fragment
              link :campaign
            end
          end
        end
      end
    end
  end
end
