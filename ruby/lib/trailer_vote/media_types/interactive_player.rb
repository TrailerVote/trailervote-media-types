# frozen_string_literal: true

require_relative 'base_text'

module TrailerVote
  module MediaTypes
    class InteractivePlayer < BaseText
      use_name 'interactive_player'

      validations do
        version 1 do
          attribute :interactive_player do
            attribute :title, AllowNil(String)

            link :self
            link :advert
            link :direct
            link :product
          end
        end
      end
    end
  end
end
