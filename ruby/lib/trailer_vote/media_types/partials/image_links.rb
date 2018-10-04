# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    module Partials
      IMAGE_LINKS = ::MediaTypes::Scheme.new do
        link :self
        link :original
        link :thumbnail, optional: true
        link :xlarge, optional: true
        link :large, optional: true
        link :medium, optional: true
        link :small, optional: true
        link :xsmall, optional: true
      end
    end
  end
end
