# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class Persona < BaseText
      media_type 'persona', defaults: { suffix: :json, version: 1 }

      validations do
        version 1 do
          attribute :persona do
            attribute :id, UuidV4
            link :self
            link :feedback
          end

          view('create') {}
        end
      end

      registrations :persona do
        view 'create', :create_persona

        versions 1
      end
    end
  end
end
