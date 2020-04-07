# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PushTokenIosTest < Minitest::Test
      def test_fixtures
        assert_fixture_passes_validation PushTokenIos
      end
    end
  end
end
