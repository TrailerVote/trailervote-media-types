# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Type for Android Push Recipe
    #
    # The push recipe is a blueprint for sending mass push notifications
    #
    class PushRecipeAndroid < BaseText
      media_type 'push_recipe_android', defaults: { suffix: :json, version: 1 }

      validations do

        version 1 do
          attribute :push_recipe_android do
            attribute :auth_token, String
            collection :tokens, String, allow_empty: true
            attribute :mediatype, String
            attribute :payload do
              not_strict
            end
          end
        end
      end

      registrations :push_recipe_android do
        versions 1
      end
    end
  end
end
