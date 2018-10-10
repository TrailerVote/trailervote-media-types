# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Partials
      IMAGE_LINKS = ::MediaTypes::Scheme.new do
        link :self

        link :original do
          attribute :content_digest, String, optional: true
          attribute :width, Numeric, optional: true
          attribute :height, Numeric, optional: true
        end

        %i[thumbnail xlarge large medium small xsmall].each do |size|
          link size, optional: true do
            attribute :content_digest, String, optional: true
            attribute :width, Numeric, optional: true
            attribute :height, Numeric, optional: true
          end
        end
      end
    end
  end
end
