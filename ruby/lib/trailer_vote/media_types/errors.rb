# frozen_string_literal: true

require 'trailer_vote/media_types/base_text'

module TrailerVote
  module MediaTypes
    ##
    # Media Types for errors
    #
    # All errors given back to any TrailerVote service have this media type. In order to ensure correct error
    # content-type negotiation, clients SHOULD include the media type with a reduced quality param q in the Accept
    # header of each request. The RECOMMENDED value for q is 0.1.
    #
    class Errors < BaseText
      media_type 'errors', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          collection :errors do
            attribute :message, String
            attribute :code, AllowNil(String)
          end
        end
      end

      registrations :errors do
        versions 1
      end
    end
  end
end
