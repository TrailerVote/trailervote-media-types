module TrailerVote
  module MediaTypes
    class UuidV4
      REGEX = /[A-z0-9]{8}-[A-z0-9]{4}-4[A-z0-9]{3}-[A-z0-9]{4}-[A-z0-9]{12}/

      def self.===(other)
        REGEX.match?(other)
      end
    end
  end
end
