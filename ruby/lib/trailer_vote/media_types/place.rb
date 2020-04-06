# frozen_string_literal: true

module TrailerVote
  module MediaTypes
    class Place < BaseText
      media_type 'place', defaults: { suffix: :json, version: 5 }

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

        version 5 do
          attribute :place do
            attribute :name, String
            attribute :parent_place, AllowNil(Types::UuidV4)
            attribute :expires_at, AllowNil(String)
            attribute :updated_at, Types::Iso8601

            link :self
            link :product_place_links
            link :products_archive
            link :fragments_archive
            link :parent, allow_nil: true
            link :children
          end
        end

        version 4 do
          attribute :place do
            attribute :name, String
            attribute :parent_place, AllowNil(Types::UuidV4)
            attribute :expires_at, AllowNil(String)
            attribute :updated_at, Types::Iso8601

            link :self
            link :products_archive
            link :fragments_archive
            link :parent, allow_nil: true
            link :children
          end

          view 'index' do
            merge index_scheme
          end
        end

        version 3 do
          attribute :place do
            attribute :name, String
            attribute :parent_place, AllowNil(Types::UuidV4)
            attribute :expires_at, AllowNil(String)
            attribute :updated_at, Types::Iso8601

            link :self
            link :products_archive
            link :parent, allow_nil: true
            link :children
          end

          view 'index' do
            merge index_scheme
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

        versions 1, 2, 3, 4, 5
      end
    end
  end
end
