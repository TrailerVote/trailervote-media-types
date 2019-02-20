# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Trivial Push Campaign
    #
    # The trivial push campaign is used to schedule a local push notification at a specified time.
    #
    class TrivialPushCampagin < BaseText
      media_type 'push_campaign_trivial', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :push_campaign_trivial do
            link :action
            attribute :message, String
            attribute :schedule_at, Types::Iso8601
          end
        end
      end

      registrations :push_campaign_trivial do
        versions 1
      end
    end
  end
end
