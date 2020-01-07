# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'
require_relative 'types/local_time'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    ##
    # Media Types for Release Push Campaign
    #
    # The release push campaign is used to show a local push notification upon product release.
    #
    class ReleasePushCampaign < BaseText
      media_type 'release_push_campaign', defaults: { suffix: :json, version: 2 }

      validations do
        version 2 do
          attribute :release_push_campaign do
            attribute :message, String
            attribute :dnd_start, Types::LocalTime
            attribute :dnd_end, Types::LocalTime
            attribute :published_at, Types::Iso8601
            attribute :archived_at, Types::Iso8601

            link :action
            link :self
            link :rich_media, optional: true
          end

          view 'create' do
            attribute :release_push_campaign do
              attribute :translations, ::Hash
              attribute :dnd_start, Types::LocalTime
              attribute :dnd_end, Types::LocalTime

              link :product
              link :action
              link :rich_media, optional: true
            end
          end
        end

        version 1 do
          attribute :release_push_campaign do
            attribute :message, String
            attribute :dnd_start, Types::LocalTime
            attribute :dnd_end, Types::LocalTime

            link :action
            link :self
            link :rich_media, optional: true
          end

          view 'create' do
            attribute :release_push_campaign do
              attribute :translations, ::Hash
              attribute :dnd_start, Types::LocalTime
              attribute :dnd_end, Types::LocalTime

              link :product
              link :action
              link :rich_media, optional: true
            end
          end
        end
      end

      registrations :release_push_campaign do
        view 'create', :create_release_push_campaign

        versions 1,2
      end
    end
  end
end
