# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/uuid_v4'

module TrailerVote
  module MediaTypes
    class PushTokenIos < BaseText
      media_type 'push_token_ios', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :token, String
            attribute :app_id, String
            attribute :device_id, Types::UuidV4
          end

          attribute :push_token_ios do
            merge version_1_base

            link :self
          end

          view 'create' do
            attribute :push_token_ios do
              merge version_1_base
            end
          end
        end
      end

      registrations :push_token_ios do
        view 'create', :create_push_token_ios

        versions 1
      end

    end
  end
end
