# frozen_string_literal: true

require 'ox'

module Trumail
  module Parser
    class Xml < Trumail::Parser::Base

      # rubocop:disable Security/Eval, Style/SingleArgumentDig
      def parse
        @hash = Ox.load(@data, mode: :hash_no_attrs)
                  .dig(:lookup)
                  .each_with_object({}) do |(key, val), hash|
                    hash[key.to_s] = begin
                      eval(val)
                    rescue StandardError, SyntaxError
                      val
                    end
                  end
      end
      # rubocop:enable Security/Eval, Style/SingleArgumentDig

    end
  end
end
