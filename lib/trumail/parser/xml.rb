# frozen_string_literal: true

require 'ox'

module Trumail
  module Parser
    class Xml < Trumail::Parser::Base

      def parse
        @hash = Ox.load(@data, mode: :hash_no_attrs)
                  .dig(:lookup)
                  .each_with_object({}) do |(key, val), hash|
                    hash[key.to_s] = eval(val) rescue val
                  end
      end

    end
  end
end
