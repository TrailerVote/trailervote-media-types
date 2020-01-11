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
      media_type 'push_campaign_trivial', defaults: { suffix: :json, version: 5 }

      filters = ::MediaTypes::Scheme.new do
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

      filters_creation = ::MediaTypes::Scheme.new do
        attribute :filter do
          attribute :platform, AllowNil(String), optional: true
          attribute :region, AllowNil(String), optional: true
          attribute :language, AllowNil(String), optional: true
          attribute :timezone, AllowNil(String), optional: true
          attribute :vote_source, AllowNil(String), optional: true
          attribute :purchased, AllowNil(Types::Boolean), optional: true
          attribute :vote_value, AllowNil(Types::VoteValue), optional: true
          attribute :vote_from, AllowNil(Types::Iso8601), optional: true
          attribute :vote_until, AllowNil(Types::Iso8601), optional: true
        end
      end

      push_creation_base = ::MediaTypes::Scheme.new do
        link :product_asset
        link :action
        attribute :schedule_at, Types::Iso8601
        attribute :translations, ::Hash
      end

      push_creation_base_v4 = ::MediaTypes::Scheme.new do
        link :product, optional: true
        link :product_asset, optional: true
        link :action
        link :rich_media, optional: true
        attribute :schedule_at, Types::Iso8601
        attribute :translations, ::Hash
      end

      validations do

        version 5 do
          attribute :push_campaign_trivial do
            link :action
            link :self
            link :rich_media, optional: true
            attribute :message, String
            attribute :schedule_at, Types::Iso8601
            attribute :published_at, AllowNil(Types::Iso8601)
            attribute :archived_at, AllowNil(Types::Iso8601)
            merge filters
          end

          view 'create' do
            attribute :push_campaign_trivial do
              merge push_creation_base_v4
              attribute :published_at, AllowNil(Types::Iso8601)
              attribute :archived_at, AllowNil(Types::Iso8601)
              merge filters_creation
            end
          end

          view 'raw' do
            attribute :push_campaign_trivial do
              link :action
              link :self
              link :rich_media, optional: true
              link :product, optional: true
              link :product_asset, optional: true
              attribute :translations, ::Hash
              attribute :schedule_at, Types::Iso8601
              attribute :published_at, AllowNil(Types::Iso8601)
              attribute :archived_at, AllowNil(Types::Iso8601)
              merge filters
            end
          end
        end

        version 4 do
          attribute :push_campaign_trivial do
            link :action
            link :self
            link :rich_media, optional: true
            attribute :message, String
            attribute :schedule_at, Types::Iso8601
            merge filters
          end

          view 'create' do
            attribute :push_campaign_trivial do
              merge push_creation_base_v4
              merge filters_creation
            end
          end

          view 'raw' do
            attribute :push_campaign_trivial do
              link :action
              link :self
              link :rich_media, optional: true
              link :product, optional: true
              link :product_asset, optional: true
              attribute :translations, ::Hash
              attribute :schedule_at, Types::Iso8601
              merge filters
            end
          end
        end

        version 3 do
          attribute :push_campaign_trivial do
            link :action
            link :self
            attribute :message, String
            attribute :schedule_at, Types::Iso8601
            merge filters
          end

          view 'create' do
            attribute :push_campaign_trivial do
              merge push_creation_base
              merge filters_creation
            end
          end

          view 'raw' do
            attribute :push_campaign_trivial do
              link :action
              link :self
              link :product_asset, optional: true
              attribute :translations, ::Hash
              attribute :schedule_at, Types::Iso8601
              merge filters
            end
          end
        end

        version 2 do
          attribute :push_campaign_trivial do
            link :action
            attribute :message, String
            attribute :schedule_at, Types::Iso8601
            merge filters
          end

          view 'create' do
            attribute :push_campaign_trivial do
              merge push_creation_base
              merge filters_creation
            end
          end

          view 'raw' do
            attribute :push_campaign_trivial do
              link :action
              link :product_asset, optional: true
              attribute :translations, ::Hash
              attribute :schedule_at, Types::Iso8601
              merge filters
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
            attribute :push_campaign_trivial do
              merge push_creation_base
            end
          end

          view 'raw' do
            attribute :push_campaign_trivial do
              link :action
              link :product_asset, optional: true
              attribute :translations, ::Hash
              attribute :schedule_at, Types::Iso8601
            end
          end
        end
      end

      registrations :push_campaign_trivial do
        view 'create', :create_push_trivial_campaign
        view 'raw', :raw_push_trivial_campaign

        versions 1, 2, 3, 4, 5
      end
    end
  end
end
