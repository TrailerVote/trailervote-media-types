# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class AudioFragmentTest < Minitest::Test

      def test_fixtures
        assert_fixture_passes_validation(AudioFragment)
      end
    end
  end
end
