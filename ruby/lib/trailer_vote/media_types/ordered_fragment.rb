# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes
    class OrderedFragment < BaseText

      use_name 'ordered_fragment'

      validations do
        version 1 do
          not_strict

          view 'index' do
            attribute :ordered_fragments do
              collection :_index, allow_empty: true do
                attribute :href, Types::HttpUrl
                attribute :q, Numeric
              end
              not_strict
            end
          end
        end
      end
    end
  end
end
