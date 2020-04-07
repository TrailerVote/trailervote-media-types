# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Fingerprints
    #
    # Clients **MUST** match the version of their audio fingerprinter and this media type version. This is a binary
    # media type and returns a file or {Errors}.
    #
    class FingerprintBinary
      include ::MediaTypes::Dsl

      def self.organisation
        'trailervote'
      end

      use_name 'fingerprint'

      validations do
        version 2 do
          suffix nil

          any
        end
      end
    end
  end
end
