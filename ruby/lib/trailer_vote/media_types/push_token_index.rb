# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'
require_relative 'types/uuid_v4'

module TrailerVote
  module MediaTypes
    class PushTokenIndex < BaseText
      media_type 'push_token_index', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :push_token_index do
            collection :push_tokens, allow_empty: true do
              attribute :device_id, Types::UuidV4

              link :push_token
            end
          end

          view 'index' do
            attribute :push_token_index do
              collection :_index, allow_empty: true do
                attribute :device_id, Types::UuidV4

                link :push_token
              end
              not_strict
            end
          end
        end
      end

      registrations :push_token_index do
        view 'index', :push_token_index

        versions 1
      end
    end
  end
end
