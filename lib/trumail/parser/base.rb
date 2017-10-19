# frozen_string_literal: true

module Trumail
  module Parser
    class Base

      attr_reader :hash

      def initialize(data)
        @data = data
        @hash = {}
      end

      def self.parse(data)
        klass = new(data)
        klass.parse
        klass.hash
      end

    end
  end
end
