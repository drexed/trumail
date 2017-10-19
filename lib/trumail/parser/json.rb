# frozen_string_literal: true

require 'json'

module Trumail
  module Parser
    class Json < Trumail::Parser::Base

      def parse
        @hash = JSON.parse(@data)
      end

    end
  end
end
