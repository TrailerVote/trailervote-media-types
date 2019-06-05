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
      media_type 'push_manifest', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :push_manifest do
            collection :campaigns, allow_empty: true do
              link :audio_fragment
              link :campaign
            end
          end
        end
      end

      registrations :push_manifest do
        versions 1
      end
    end
  end
end
