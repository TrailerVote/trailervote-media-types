# frozen_string_literal: true

require_relative 'base_text'
require_relative 'partials/image_links'
require_relative 'types/product_image_type'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class SentimentFeedback < BaseText
      validations do

        version 1 do
          link :action
          link :self
          attribute :showtime, Types::Iso8601
        end

      end
    end
  end
end
