# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
    class InteractivePlayer < BaseText
      media_type 'products_listing'

      defaults do
        suffix :json
        version 1
      end

      validations do
        version 1 do
          attribute :title, AllowNil(String)

          link :self
          link :advert
          link :direct
          link :product
        end
      end

      registrations :interactive_player do
        type_alias 'interactive-player'
      end
    end
  end
end
