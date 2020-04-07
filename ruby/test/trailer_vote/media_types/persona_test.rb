# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PersonaTest < Minitest::Test
      def test_fixtures
        assert_fixture_passes_validation Persona
      end
    end
  end
end
