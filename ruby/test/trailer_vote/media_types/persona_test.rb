# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class PersonaTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        assert_equal 'application/vnd.trailervote.persona.v1+json', Persona.to_constructable.to_s
      end

      def test_it_registers
        assert_registered_types(
          Persona,
          'application/vnd.trailervote.persona.v1+json' => [:persona_v1_json, []],
          'application/vnd.trailervote.persona.v1.create+json' => [:create_persona_v1_json, []]
        )
      end

      def test_fixtures
        assert_fixture_passes_validation Persona
      end
    end
  end
end
