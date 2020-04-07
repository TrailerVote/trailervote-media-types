# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class VistaConfigTest < Minitest::Test
      def test_fixtures
        assert_fixture_passes_validation VistaConfig
      end
    end
  end
end
