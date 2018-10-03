# frozen_string_literal: true

require_relative './base_text'

module TrailerVote
  module MediaTypes
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
            attribute :parent_place, AllowNil(UuidV4)
            attribute :deleted_at, AllowNil(String)
            attribute :updated_at, String

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
              attribute :deleted_at, AllowNil(String)
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
            attribute :deleted_at, AllowNil(String)
            attribute :updated_at, String

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
