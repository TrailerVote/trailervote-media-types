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
      use_name 'configuration'

      validations do

        version 5 do
          attribute :configuration do
            link :self
            link :place
            link :push_manifest
            link :products
            link :product_lookup
            link :persona do
              attribute :href, Types.makeFormattedUrl(:uuid)
              attribute :templated, TrueClass
            end
            link :lookup do
              attribute :href, Types.makeFormattedUrl(:authority, :identifier)
              attribute :templated, TrueClass
            end
            link :analytics do
              attribute :href, Types::InfluxDbConnectionUrl
            end
            link :telemetrics do
              attribute :href, Types::InfluxDbConnectionUrl
            end
            link :issues
            link :persona_config do
              attribute :href, Types.makeFormattedUrl(:persona)
              attribute :templated, TrueClass
            end
            attribute :customer_config
          end
        end

        version 4 do
          attribute :configuration do
            link :self
            link :place
            link :push_manifest
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
            link :issues
            link :persona_config do
              attribute :href, Types.makeFormattedUrl(:persona)
              attribute :templated, TrueClass
            end
            attribute :customer_config
          end
        end

        version 3 do
          attribute :configuration do
            link :self
            link :place
            link :push_manifest
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
            link :issues
          end
        end

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
            link :issues
          end
        end

        version 1 do
          attribute :configuration do
            link :place
            link :products
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
    end
  end
end
