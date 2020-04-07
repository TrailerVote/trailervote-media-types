# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PushManifestTest < Minitest::Test
      def test_fixtures
        assert_fixture_passes_validation PushManifest
      end
    end
  end
end
