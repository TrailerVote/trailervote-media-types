# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class AudioFragment < BaseText
      media_type 'audio_fragment', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :content_addressable, String
            attribute :deleted_at, AllowNil(String)

            link :self
            link :product
            link :feedback
            link :advert
            link :direct, optional: true
          end

          attribute :audio_fragment do
            merge version_1_base
          end

          view 'index' do
            attribute :audio_fragments do
              collection :_index, allow_empty: true do
                attribute :href, String
                not_strict
              end

              not_strict
            end
          end

          view 'collection' do
            attribute :audio_fragments do
              collection :_embedded, version_1_base
              not_strict
            end
          end
        end
      end

      registrations :audio_fragment do
        view 'index', :audio_fragment_urls
        view 'collection', :audio_fragments

        versions 1

        type_alias 'audio-fragment'
      end
    end
  end
end
