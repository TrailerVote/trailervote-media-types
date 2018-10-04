# frozen_string_literal: true

require_relative './base_text'
require_relative './types/uuid_v4'
require_relative './types/vote_value'

module TrailerVote
  module MediaTypes
    class Feedback < BaseText
      media_type 'feedback', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :value, Types::VoteValue
            attribute :updated_at, String

            link :audio_fragment
            link :product
            link :persona
          end

          attribute :feedback do
            merge version_1_base
          end

          view 'collection' do
            attribute :feedback do
              collection :_embedded, version_1_base, allow_empty: true
              not_strict
            end
          end

          view 'create' do
            attribute :feedback do
              attribute :persona, Types::UuidV4
              attribute :value, Types::VoteValue
            end
          end
        end
      end

      registrations :feedback do
        view 'create', :create_feedback
        view 'collection', :feedback_collection
      end
    end
  end
end
