# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/influx_db_connection_url'
require_relative 'types/formatted_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Configuration
    #
    class Configuration < BaseText
      media_type 'configuration', defaults: { suffix: :json, version: 2 }

      validations do
        version 2 do
          attribute :configuration do
            link :self
            link :place
            link :products
            link :product_lookup
            link :persona do
              attribute :href, Types.makeFormattedUrl(:uuid)
              attribute :templated, TrueClass
            end
            link :analytics do
              attribute :href, Types::InfluxDbConnectionUrl
            end
            link :telemetrics do
              attribute :href, Types::InfluxDbConnectionUrl
            end
          end
        end

        version 1 do
          attribute :configuration do
            link :place
            link :feedback do
              attribute :href, Types.makeFormattedUrl(:uuid)
              attribute :templated, TrueClass
            end
            link :persona do
              attribute :href, Types.makeFormattedUrl(:uuid)
              attribute :templated, TrueClass
            end
            link :analytics do
              attribute :href, AllowNil(Types::InfluxDbConnectionUrl)
            end
          end
        end
      end

      registrations :configuration do
        versions 1, 2
      end
    end
  end
end
