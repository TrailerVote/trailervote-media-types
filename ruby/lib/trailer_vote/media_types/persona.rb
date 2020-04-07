# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/uuid_v4'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Persona
    #
    # A Persona is a uniquely identified person / a unique device. When someone uses the SDK, the client MUST generate a
    # UUID v4 and use that as Persona. This allows the API to link Feedback on Audio Fragments to a Persona, and MAY act
    # as likes/dislikes (interests/disinterests).
    #
    class Persona < BaseText
      use_name 'persona'

      validations do
        version 1 do
          attribute :persona do
            attribute :id, Types::UuidV4
            link :self
            link :feedback
          end

          view('create') {}
        end

        version 2 do
          attribute :persona do
            attribute :id, Types::UuidV4
            link :self
            link :feedback
            link :push_consent
          end
        end
      end
    end
  end
end
