# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Type for the Manifest Update action
    #
    # The manifest update action is used to force clients to update the manifest
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
