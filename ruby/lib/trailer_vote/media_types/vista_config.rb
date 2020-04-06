# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes
    class VistaConfig < BaseText
      media_type 'vista_config', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :vista_config do
            attribute :api_key, String
            attribute :base_url, Types::HttpUrl
            attribute :trailer_vote_key, String
            attribute :trailer_vote_secret, String
          end

          view 'index' do
            attribute :vista_configs do
              collection :_index, allow_empty: true do
                attribute :api_key, String
                attribute :base_url, Types::HttpUrl
                attribute :trailer_vote_key, String
                attribute :trailer_vote_secret, String
              end
              not_strict
            end
          end
        end
      end

      registrations :vista_config do
        view 'index', :vista_config_urls

        versions 1
      end
    end
  end
end
