# frozen_string_literal: true

require_relative '../test_helper'

module TrailerVote
  class MediaTypesTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::TrailerVote::MediaTypes::VERSION
    end

    def test_it_loads_everything
      %i[
        BaseText

        AudioFragment
        Configuration
        ClientConfiguration
        Errors
        FingerprintBinary
        ProductLookup
        SentimentFeedback

        Feedback
        Persona
        Place
        Product
        ProductImage
        ProductPlaceLink
        ProductVideo
      ].each do |klazz|
        assert TrailerVote::MediaTypes.const_defined?(klazz),
               format('Expected %<klazz>s to be eager loaded', klazz: klazz)
      end
    end
  end
end
