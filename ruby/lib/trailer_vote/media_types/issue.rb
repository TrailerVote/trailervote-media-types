# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes
    class Issue < BaseText
      use_name 'issue'

      validations do
        index_scheme = ::MediaTypes::Scheme.new do
          attribute :issues do
            collection :_index, allow_empty: true do
              attribute :href, Types::HttpUrl
              not_strict
            end

            not_strict
          end
        end

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

          view 'index' do
            merge index_scheme
          end
        end
      end
    end
  end
end
