# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'
require_relative 'types/time'

module TrailerVote
  module MediaTypes
    ##
    # Media Types for Release Push Campaign
    #
    # The release push campaign is used to show a local push notification upon product release.
    #
    class ReleasePushCampaign < BaseText
      media_type 'release_push_campaign', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :release_push_campaign do
            attribute :message, String
            attribute :dnd_start, Types::Time
            attribute :dnd_end, Types::Time

            link :action
            link :self
            link :rich_media, optional: true
          end

          view 'create' do
            attribute :release_push_campaign do
              attribute :translations, ::Hash
              attribute :dnd_start, Types::Time
              attribute :dnd_end, Types::Time

              link :product
              link :action
              link :rich_media, optional: true
            end
          end
        end
      end

      registrations :release_push_campaign do
        view 'create', :create_release_push_campaign

        versions 1
      end
    end
  end
end
