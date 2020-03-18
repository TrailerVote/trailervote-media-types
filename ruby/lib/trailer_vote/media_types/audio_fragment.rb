# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/http_url'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Audio Fragments
    #
    # Audio Fragments are recognizable using {FingerprintBinary}. It might be an advertisement, a trailer or a sound
    # bite. They belong to a {Product}. Audio fragments are used for recognition, e.g. showing an advertisement when
    # it's recognised, and used for feedback, i.e. a requirement to record and store {Feedback}.
    #
    class AudioFragment < BaseText

      # @!method to_constructable
      #   Returns the construtable media type
      #
      #   @see https://www.rubydoc.info/gems/media_types/MediaTypes/Constructable ::MediaTypes::Constructable
      #   @return [::MediaTypes::Constructable] a constructable
      #
      use_name 'audio_fragment'

      # @!method valid?(data, constructed_media_type, **opts)
      #   Validates the +data+ against the validation for +constructed_media_type+.
      #
      #   @see https://www.rubydoc.info/gems/media_types/MediaTypes/Scheme#valid%3F-instance_method ::MediaTypes::Scheme#valid?
      #   @see https://www.rubydoc.info/gems/media_types/MediaTypes/Constructable#valid%3F-instance_method ::MediaTypes::Constructable#valid?
      #
      #   @param [Object] data the data to validate
      #   @param [Constructable, String] constructed_media_type something that resolved into a media type with validations
      #   @param [Hash] opts passed on to {::MediaTypes::Scheme#valid?}
      #
      #   @return [TrueClass, FalseClass] true if valid, false otherwise
      #
      # @!method validate!(data, constructed_media_type, **opts)
      #   Validates the +data+ against the validation for +constructed_media_type+. Raises if invalid
      #
      #   @see https://www.rubydoc.info/gems/media_types/MediaTypes/Scheme#validate-instance_method ::MediaTypes::Scheme#validate
      #   @see https://www.rubydoc.info/gems/media_types/MediaTypes/Constructable#validate!-instance_method ::MediaTypes::Constructable#validate!
      #   @see https://www.rubydoc.info/gems/media_types/MediaTypes/Scheme/ValidationError ::MediaTypes::Scheme::ValidationError
      #
      #   @param [Object] data the data to validate
      #   @param [Constructable, String] constructed_media_type something that resolved into a media type with validations
      #   @param [Hash] opts passed on to {::MediaTypes::Scheme#validate}
      #
      #   @raise ::MediaTypes::Scheme::ValidationError an error if the scheme is not valid
      #   @return [TrueClass] true if valid
      #
      validations do
        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :content_addressable, String
            attribute :expires_at, AllowNil(Types::Iso8601)

            link :self
            link :product
            link :feedback
            link :advert
            link :direct
          end

          attribute :audio_fragment do
            merge version_1_base
          end

          view 'index' do
            attribute :audio_fragments do
              collection :_index, allow_empty: true do
                attribute :href, Types::HttpUrl
                not_strict
              end

              not_strict
            end
          end

          view 'collection' do
            attribute :audio_fragments do
              collection :_embedded, version_1_base, allow_empty: true
              not_strict
            end
          end
        end
      end
    end
  end
end
