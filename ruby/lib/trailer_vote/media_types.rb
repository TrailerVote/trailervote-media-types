# frozen_string_literal: true

require 'media_types'
require_relative './media_types/version'

require_relative './media_types/base_text'
require_relative './media_types/audio_fragment'
require_relative './media_types/configuration'
require_relative './media_types/client_configuration'
require_relative './media_types/errors'
require_relative './media_types/fingerprint_binary'
require_relative './media_types/product_lookup'
require_relative './media_types/sentiment_feedback'
require_relative './media_types/carousel'
require_relative './media_types/feedback_listing'
require_relative './media_types/interactive_player'
require_relative './media_types/products_listing'
require_relative './media_types/feedback'
require_relative './media_types/persona'
require_relative './media_types/place'
require_relative './media_types/product'
require_relative './media_types/product_image'
require_relative './media_types/product_place_link'
require_relative './media_types/product_video'
require_relative './media_types/push_trivial_campaign'
require_relative './media_types/push_manifest'
require_relative './media_types/issue'
require_relative './media_types/push_consent'
require_relative './media_types/push_token_index'
require_relative './media_types/push_token_android'
require_relative './media_types/push_token_ios'
require_relative './media_types/release_push_campaign'

module TrailerVote
  module MediaTypes
    INDEX_VIEW = ::MediaTypes::INDEX_VIEW
    COLLECTION_VIEW = ::MediaTypes::COLLECTION_VIEW
    CREATE_VIEW = ::MediaTypes::CREATE_VIEW
    ORDERED_VIEW = 'ordered'
  end
end
