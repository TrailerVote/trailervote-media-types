module TrailerVote
  module MediaTypes
    class Showing < MediaTypes::BaseText
      media_type 'showing', defaults:{suffix: :json, version: 1}

      validations do

        index_scheme = ::MediaTypes::Scheme.new do
          attribute :showings do
            collection :_index, allow_empty: true do
              attribute :href, Types::HttpUrl
              not_strict
            end

            not_strict
          end
        end

        view 'index' do
          merge index_scheme
        end

        view 'create' do
          attribute :showing do
            attribute :showtime, Types::Iso8601
          end
        end


        version 1 do
          attribute :showing do
            link :self
            link :product_place_link
            attribute :showtime, Types::Iso8601
          end
        end


      end

      registrations :Showing do
        view 'create', :create_showing

        versions 1
      end
    end
  end
end
