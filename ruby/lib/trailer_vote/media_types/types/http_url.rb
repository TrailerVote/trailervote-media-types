# frozen_string_literal: true

module TrailerVote
  module MediaTypes
    module Types
      # noinspection RubyConstantNamingConvention
      #
      # https://mathiasbynens.be/demo/url-regex
      #
      # RFC compliant for http, https and ftp:
      # _^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})
      # (?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})
      # (?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.
      # (?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\.
      # (?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\.(?:[a-z\x{00a1}-\x{ffff}]{2,})))(?::\d{2,5})?
      # (?:/[^\s]*)?$_iuS
      #
      # The one used here actually passes all valid urls, but just doesn't reject ALL invalid ones
      #
      HttpUrl = %r{^https?:\/\/[^\s\/$.?#].[^\s]*$} # rubocop:disable Naming/ConstantName
    end
  end
end
