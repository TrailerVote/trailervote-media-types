# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/uuid_v4'
require_relative 'types/iso8601'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for places
    #
    # Each set of credentials has a Place associated to it. A place might be the HQ of an enterprise, or a physical
    # location on the map. You can always access all the data of your place and all the children, as the places in our
    # system are configured to be a tree.
    #
    class Place < BaseText
      media_type 'place', defaults: { suffix: :json, version: 2 }

      validations do
        index_scheme = ::MediaTypes::Scheme.new do
          attribute :places do
            collection :_index, allow_empty: true do
              attribute :href, String
              not_strict
            end

            not_strict
          end
        end

        version 2 do
          version_2_base = ::MediaTypes::Scheme.new do
            attribute :name, String
            attribute :parent_place, AllowNil(Types::UuidV4)
            attribute :expires_at, AllowNil(String)
            attribute :updated_at, Types::Iso8601

            link :self
            link :products_archive
            link :parent, allow_nil: true
          end

          attribute :place do
            merge version_2_base
          end

          view 'create' do
            attribute :place do
              attribute :name, String
              attribute :parent_place, String
              attribute :expires_at, AllowNil(Types::Iso8601)
            end
          end

          view 'collection' do
            attribute :places do
              collection :_embedded, version_2_base
              not_strict
            end
          end

          view 'index' do
            merge index_scheme
          end
        end

        version 1 do
          version_1_base = ::MediaTypes::Scheme.new do
            attribute :name, String
            attribute :parent_place, AllowNil(String)
            attribute :expires_at, AllowNil(String)
            attribute :updated_at, Types::Iso8601

            link :self
            link :products
            link :parent, allow_nil: true
          end

          attribute :place do
            merge version_1_base
          end

          view 'collection' do
            attribute :places do
              collection :_embedded, version_1_base
              not_strict
            end
          end

          view 'index' do
            merge index_scheme
          end
        end
      end

      registrations :place do
        view 'create', :create_place
        view 'index', :place_urls
        view 'collection', :places

        versions 1, 2
      end
    end
  end
end
