# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'
require_relative 'types/iso8601'
require_relative 'types/boolean'
require_relative 'types/vote_value'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Trivial Push Campaign
    #
    # The trivial push campaign is used to schedule a local push notification at a specified time.
    #
    class PushTrivialCampaign < BaseText
      media_type 'push_campaign_trivial', defaults: { suffix: :json, version: 2 }

      validations do

		version 2 do
			attribute :push_campaign_trivial do
				link :action
				attribute :message, String
				attribute :schedule_at, Types::Iso8601
				attribute :filter do
					attribute :platform, AllowNil(String)
					attribute :region, AllowNil(String)
					attribute :language, AllowNil(String)
					attribute :timezone, AllowNil(String)
					attribute :vote_source, AllowNil(String)
					attribute :purchased, AllowNil(Types::Boolean)
					attribute :vote_value, AllowNil(Types::VoteValue)
					attribute :vote_from, AllowNil(Types::Iso8601)
					attribute :vote_until, AllowNil(Types::Iso8601)
				end
			end
		end

        version 1 do
          attribute :push_campaign_trivial do
            link :action
            attribute :message, String
            attribute :schedule_at, Types::Iso8601
          end

          view 'create' do
            attribute :product_asset_id, Types::UuidV4
            attribute :url, String
            attribute :schedule_at, Types::Iso8601
            attribute :place_id, Types::UuidV4
            attribute :translations, ::Hash
          end
        end
      end

      registrations :push_campaign_trivial do
        versions 1, 2
      end
    end
  end
end
