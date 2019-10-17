# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class PushConsent < BaseText
      media_type 'push_consent', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :push_consent do
            attribute :region, String
            attribute :opt_in, Boolean
            attribute :signed_at, Types::Iso8601

            link :tos
            link :tokens
          end
        end
      end

      registrations :push_consent do
        versions 1
      end
    end
  end
end
