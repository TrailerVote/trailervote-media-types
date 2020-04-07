# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PlaceTest < Minitest::Test
      def test_fixtures
        assert_fixture_passes_validation Place
      end
    end
  end
end
