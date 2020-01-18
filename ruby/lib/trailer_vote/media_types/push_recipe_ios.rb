# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Type for iOS push recipe
    #
    # The push recipe is a blueprint for sending mass push notifications
    #
    class PushRecipeIos < BaseText
      media_type 'push_recipe_ios', defaults: { suffix: :json, version: 1 }

      validations do

        version 1 do
          attribute :push_recipe_ios do
            attribute :auth_key, String
            attribute :key_id, String
            attribute :team_id, String
            attribute :topic, String
            collection :tokens, String, allow_empty: true
            attribute :mediatype, String
            attribute :payload do
              not_strict
            end
          end
        end
      end

      registrations :push_recipe_ios do
        versions 1
      end
    end
  end
end
