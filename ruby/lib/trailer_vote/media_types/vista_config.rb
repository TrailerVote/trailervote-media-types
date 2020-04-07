# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes
    class VistaConfig < BaseText
      use_name 'vista_config'

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
    end
  end
end
