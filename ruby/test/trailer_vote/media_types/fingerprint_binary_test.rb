# frozen_string_literal: true

require_relative '../../test_helper'

module TrailerVote
  module MediaTypes
    class FingerprintBinaryTest < Minitest::Test

      def test_the_group_deprecated_media_type
        # This media type is not actually "used". It holds all the versions that are not current.
        assert_equal 'application/vnd.trailervote.fingerprint.deprecated',
                     FingerprintBinary::Deprecated.to_constructable.to_s
      end

    end
  end
end
