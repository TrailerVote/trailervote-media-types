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
      use_name 'manifest_update'

      validations do

        version 1 do
          attribute :manifest_update do
          end
        end
      end
    end
  end
end
