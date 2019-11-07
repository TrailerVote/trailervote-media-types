# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes
    class OrderedFragment < BaseText

      media_type 'ordered_fragment', defaults: { suffix: :json, version: 1, view: :index }

      validations do
        version 1 do
          view 'index' do
            attribute :ordered_fragments do
              collection :_index, allow_empty: true do
                attribute :href, Types::HttpUrl
                attribute :q, Float
              end
              not_strict
            end
          end
        end
      end

      registrations :audio_fragment do
        view 'index', :ordered_fragment_urls

        versions 1

        type_alias 'ordered-fragment'
      end
    end
  end
end
