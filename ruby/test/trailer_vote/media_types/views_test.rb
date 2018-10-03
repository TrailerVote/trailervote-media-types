# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class ViewsTest < Minitest::Test
      [Carousel, ProductsListing, FeedbackListing, InteractivePlayer].each do |type|
        define_method(format('test_%<name>s_fixtures', name: type.name)) do
          assert_fixture_passes_validation type
        end
      end
    end
  end
end
