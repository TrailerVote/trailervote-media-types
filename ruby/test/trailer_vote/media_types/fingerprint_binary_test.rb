# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class FingerprintBinaryTest < Minitest::Test

      def test_the_default_media_type
        # When this changes, the default version has changes and you should make downstream changes / have this gems
        # version change as well. If you pin a certain media type gem version, you get consistent media types.
        #
        # The version in this type is given by the caller / the one who registers.
        #
        assert_equal 'application/vnd.trailervote.fingerprint.vC', FingerprintBinary::Current.to_constructable.to_s
      end

      def test_the_group_deprecated_media_type
        # This media type is not actually "used". It holds all the versions that are not current.
        assert_equal 'application/vnd.trailervote.fingerprint.deprecated',
                     FingerprintBinary::Deprecated.to_constructable.to_s
      end

      def test_it_registers_current
        assert_registered_types(
          FingerprintBinary::Current,
          'application/vnd.trailervote.fingerprint.vC' => [:fingerprint_bin, []]
        ) do |media_type|
          media_type.register(version: 'C').flatten
        end
      end

      def test_it_registers_deprecated
        assert_registered_types(
          FingerprintBinary::Deprecated,
          'application/vnd.trailervote.fingerprint.deprecated' => [
            :fingerprint_deprecated_bin,
            %w[
              application/vnd.trailervote.fingerprint.v0
              application/vnd.trailervote.fingerprint.v1
              application/vnd.trailervote.fingerprint.v2
            ]
          ]
        ) do |type|
          type.register(versions: (0...3))
        end
      end
    end
  end
end
