# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class Issue < BaseText
      media_type 'issue', defaults: { suffix: :json, version: 1 }

      validations do

        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :error_name, String
            attribute :error_message, String

            attribute :rescue_context do
              attribute :caller, String
              attribute :args, ::Hash, allow_empty: true do
                not_strict
              end
            end
          end

          attribute :issue do
            merge version_1_base
            attribute :updated_at, Types::Iso8601

            link :self
          end

          view 'create' do
            attribute :issue do
              merge version_1_base
            end
          end
        end
      end

      registrations :issue do
        view 'create', :create_issue

        versions 1
      end

    end
  end
end
