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
    class ManifestUpdate < BaseText
      media_type 'manifest_update', defaults: { suffix: :json, version: 1 }

      validations do

        version 1 do
          attribute :manifest_update do
          end
        end
      end

      registrations :manifest_update do
        versions 1
      end
    end
  end
end
