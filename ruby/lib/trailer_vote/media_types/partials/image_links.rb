# frozen_string_literal: true

require 'media_types'
require_relative '../types/product_image_type'

module TrailerVote
  module MediaTypes
    module Partials
      IMAGE_LINKS = ::MediaTypes::Scheme.new do
        link :self do
          attribute :type, Types::ProductImageType, optional: true
        end

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
