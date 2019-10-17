# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/boolean'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class PushConsent < BaseText
      media_type 'push_consent', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :region, String
            attribute :opt_in, Types::Boolean
            attribute :signed_at, Types::Iso8601
          end

          attribute :push_consent do
            merge version_1_base

            link :tos
            link :tokens
          end

          view 'create' do
            merge version_1_base
          end
        end
      end

      registrations :push_consent do
        view 'create', :create_push_consent

        versions 1
      end
    end
  end
end
