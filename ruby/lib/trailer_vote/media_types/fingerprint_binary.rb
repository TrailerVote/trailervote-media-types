# frozen_string_literal: true

require 'media_types'

module TrailerVote
  module MediaTypes
    class FingerprintBinary
      include ::MediaTypes::Dsl

      def self.base_format
        'application/vnd.trailervote.fingerprint.v%<version>s'
      end

      media_type 'fingerprint', defaults: { version: '~' }

      class Current < FingerprintBinary
        media_type 'fingerprint', defaults: { version: 'C' }

        class << self
          def register(version:, **___)
            mime_type = FingerprintBinary.to_constructable.version(version).to_s

            Array(
              ::MediaTypes::Registerable.new(
                mime_type,
                symbol: :fingerprint_bin,
                aliases: []
              ).tap { |registerable| ::MediaTypes.register(registerable) }
            )
          end
        end
      end

      class Deprecated < FingerprintBinary
        def self.base_format
          'application/vnd.trailervote.fingerprint.deprecated'
        end

        media_type 'fingerprint.deprecated', defaults: { version: nil }

        class << self

          def register(versions:, **___)
            aliases = versions.map do |version|
              FingerprintBinary.to_constructable.version(version).to_s
            end

            Array(
              ::MediaTypes::Registerable.new(
                base_format,
                symbol: :fingerprint_deprecated_bin,
                aliases: aliases
              ).tap { |registerable| ::MediaTypes.register(registerable) }
            )
          end
        end
      end
    end
  end
end
