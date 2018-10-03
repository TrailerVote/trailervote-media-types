# frozen_string_literal: true

require 'trailer_vote/media_types/base_text'

module TrailerVote
  module MediaTypes
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
