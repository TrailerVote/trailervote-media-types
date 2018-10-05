# frozen_string_literal: true

module TrailerVote
  module MediaTypes
    module Types
      module_function

      class FormattedUrl

        class UnexpectedFormatVariable < ::MediaTypes::Scheme::ValidationError
          def initialize(variables:, actual:)
            self.variables = variables
            self.actual = actual
          end

          def message
            format(
              'Expected a formatted url only containing %<variables>s, instead got %<actual>s',
              variables: variables,
              actual: actual
            )
          end

          private

          attr_accessor :variables, :actual
        end

        def initialize(*variables)
          @variables = variables.map { |variable| "{#{variable}}" }
          variable_options = @variables.map { |variable| Regexp.escape(variable) }
          sections_first = "(?>#{variable_options.push('[^\s\/$.?#\{\}]').join('|')})"
          sections_not_first = "(?>#{variable_options.push('[^\\s\\{\\}]').join('|')})"

          @test = %r{^https?:\/\/#{sections_first}#{sections_not_first}*$}
        end

        def ===(other)
          return true if @test.match?(other)
          raise UnexpectedFormatVariable.new(variables: @variables, actual: other)
        end
      end

      # noinspection RubyInstanceMethodNamingConvention
      #
      def makeFormattedUrl(*variables) # rubocop:disable Naming/MethodName
        FormattedUrl.new(*variables)
      end
    end
  end
end
