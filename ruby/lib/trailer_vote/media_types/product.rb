# frozen_string_literal: true

require_relative 'base_text'
require_relative 'types/product_data_type'
require_relative 'types/iso8601'
require_relative 'types/http_url'

module TrailerVote
  module MediaTypes

    ##
    # Media Types for Products
    #
    # Products are all things that are the subject of Audio Fragments (advertisements, trailers, sound bites). This can
    # be a book; a movie; a car; a drink; anything that would be a product in the real world. Recognition is done on the
    # audio fragments, not on products directly.
    #
    # A product has attachments, such as data, {ProductImage}, and recognizable {AudioFragment}.
    #
    class Product < BaseText
      use_name 'product'

      validations do
        index_scheme = ::MediaTypes::Scheme.new do
          attribute :products do
            collection :_index, allow_empty: true do
              attribute :href, Types::HttpUrl
              not_strict
            end

            not_strict
          end
        end

        version 2 do
          version_2_creation = ::MediaTypes::Scheme.new do
            attribute :name, String
            attribute :description, AllowNil(String)

            collection :product_identifiers do
              attribute :authority, String
              attribute :identifier, String
            end

            attribute :data do
              any do
                attribute :type, Types::ProductDataType
                attribute :type_version, Numeric

                attribute :translations do
                  any do
                    attribute :name, AllowNil(String), optional: true
                    attribute :description, AllowNil(String), optional: true
                  end
                end

                # Movie type properties
                collection :genres, String, optional: true, allow_empty: true
                attribute :mpaa_rating, AnyOf('G', 'PG', 'PG-13', 'R', 'NC-17', 'NR', NilClass), optional: true
                attribute :run_time, AllowNil(Numeric), optional: true
                attribute :release_date, AllowNil(Types::Iso8601), optional: true
                attribute :default_image_url, AllowNil(String), optional: true

                not_strict
              end
            end

            attribute :raw_data, optional: true do
              # noinspection RubyBlockToMethodReference
              not_strict
            end
          end

          version_2_base = ::MediaTypes::Scheme.new do
            attribute :updated_at, Types::Iso8601
            attribute :lock_version, Numeric

            merge version_2_creation

            link :self
            link :images
            link :videos
            link :places
            link :audio_fragments
          end

          attribute :product do
            merge version_2_base
          end

          view 'create' do
            attribute :product do
              merge version_2_creation
            end
          end

          view 'collection' do
            attribute :products do
              collection :_embedded, version_2_base
              not_strict
            end
          end

          view 'index' do
            merge index_scheme
          end
        end

        version 1 do

          version_1_creation = ::MediaTypes::Scheme.new do
            attribute :name, String
            attribute :description, AllowNil(String)

            collection :product_identifiers do
              attribute :authority, String
              attribute :identifier, String
            end

            attribute :data do
              any do
                attribute :type, Types::ProductDataType
                attribute :type_version, Numeric
                attribute :name, AllowNil(String)
                attribute :description, AllowNil(String)

                # Movie type properties
                collection :genres, String, optional: true, allow_empty: true
                attribute :mpaa_rating, AnyOf('G', 'PG', 'PG-13', 'R', 'NC-17', 'NR', NilClass), optional: true
                attribute :run_time, AllowNil(Numeric), optional: true
                attribute :release_date, AllowNil(Types::Iso8601), optional: true
                attribute :default_image_url, AllowNil(String), optional: true

                not_strict
              end
            end

            attribute :raw_data, optional: true do
              # noinspection RubyBlockToMethodReference
              not_strict
            end
          end

          version_1_base = ::MediaTypes::Scheme.new do
            attribute :updated_at, Types::Iso8601
            attribute :lock_version, Numeric

            merge version_1_creation

            link :self
            link :images
            link :videos
            link :places
            link :audio_fragments
          end

          attribute :product do
            merge version_1_base
          end

          view 'create' do
            attribute :product do
              merge version_1_creation
            end
          end

          view 'collection' do
            attribute :products do
              collection :_embedded, version_1_base
              not_strict
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
