# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/boolean'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class PushConsent < BaseText
      use_name 'push_consent'

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
            attribute :push_consent do
              merge version_1_base

              link :tos
            end
          end
        end
      end
    end
  end
end
